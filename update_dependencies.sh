#!/bin/bash

# Script to update dependencies and fix security vulnerabilities
echo "🔧 Updating project dependencies..."

# Check if poetry is available
if command -v poetry &> /dev/null; then
    echo "Using Poetry to update dependencies..."
    poetry update
    poetry install
else
    echo "Poetry not found. Using pip..."
    # Create requirements.txt from pyproject.toml if needed
    if [ -f "requirements.txt" ]; then
        pip install -r requirements.txt --upgrade
    else
        echo "Please install poetry or create requirements.txt"
        exit 1
    fi
fi

echo "✅ Dependencies updated successfully!"
echo "📋 Run your tests to ensure everything works correctly"
echo "🔐 Check GitHub Security tab for remaining vulnerabilities"
