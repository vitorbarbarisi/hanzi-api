#!/usr/bin/env python3
"""
Simple script to run the tone_pair update
Usage: python run_tone_pair_update.py
"""

import asyncio
import sys
import os

# Add the project root to Python path
sys.path.insert(0, os.path.dirname(__file__))

from scripts.update_tone_pair_existing_records import main

if __name__ == "__main__":
    print("Running tone_pair update for existing records...")
    asyncio.run(main())
