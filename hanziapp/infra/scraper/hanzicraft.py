"""HanziCraft scraper for the optional "Appears In" character section."""

import os
import re
from typing import Optional
from urllib.parse import quote

import httpx
from bs4 import BeautifulSoup

BASE_URL = "https://hanzicraft.com/character/{character}"

# Browser-like header; HanziCraft rejects requests without a real User-Agent.
_HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"
    )
}

# Matches the "Appears In" heading regardless of case/extra whitespace.
_APPEARS_IN_RE = re.compile(r"appears\s*in", re.IGNORECASE)


class HanziCraftScraper:
    """Scrapes the optional "Appears In" section from a HanziCraft character page."""

    def __init__(self, character: str):
        """Initialize the scraper.

        Args:
            character: The Chinese character to look up
        """
        self.character = character
        # Same corporate-proxy SSL toggle used by the LLM integrations.
        self.ssl_verify = os.environ.get("SSL_VERIFY", "true").lower() != "false"

    def get_appears_in(self) -> str:
        """Fetch and parse the "Appears In" section for the character.

        Returns:
            The text content of the "Appears In" section, or "" when the
            section is absent or the page cannot be fetched/parsed.
        """
        try:
            url = BASE_URL.format(character=quote(self.character))
            response = httpx.get(
                url,
                headers=_HEADERS,
                timeout=30,
                follow_redirects=True,
                verify=self.ssl_verify,
            )
            response.raise_for_status()
            return self._parse_appears_in(response.text)
        except Exception as e:
            print(f"HanziCraft scrape failed for '{self.character}': {e}")
            return ""

    def _parse_appears_in(self, html: str) -> str:
        """Extract the "Appears In" section content from the page HTML.

        The section is optional and only present for characters that appear
        as a component of other characters/words.
        """
        soup = BeautifulSoup(html, "html.parser")

        # Find the heading whose text is "Appears In".
        heading = soup.find(
            lambda tag: tag.name in ("h1", "h2", "h3", "h4", "h5", "strong", "b")
            and tag.get_text(strip=True)
            and _APPEARS_IN_RE.match(tag.get_text(strip=True))
        )
        if heading is None:
            return ""

        # Collect content from the section that follows the heading. Prefer the
        # heading's next sibling container; fall back to the parent's text.
        container = heading.find_next_sibling()
        if container is None:
            container = heading.parent

        if container is None:
            return ""

        # Prefer the linked characters/words if present; otherwise plain text.
        links = container.find_all("a")
        if links:
            items = [a.get_text(strip=True) for a in links if a.get_text(strip=True)]
            text = " ".join(items)
        else:
            text = container.get_text(separator=" ", strip=True)

        return _APPEARS_IN_RE.sub("", text).strip()
