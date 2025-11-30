#!/bin/bash

# Script to build and upload the package to PyPI
# Usage: ./build_and_upload.sh [testpypi|pypi]

set -e

REPOSITORY=${1:-pypi}

# Activate virtual environment if it exists
if [ -d "venv" ]; then
    echo "Activating virtual environment..."
    source venv/bin/activate
elif [ -d ".venv" ]; then
    echo "Activating virtual environment..."
    source .venv/bin/activate
fi

echo "Building package..."
python -m build

echo ""
echo "Built files:"
ls -lh dist/

echo ""
echo "Checking package..."
twine check dist/*

if [ "$REPOSITORY" = "testpypi" ]; then
    echo ""
    echo "Uploading to TestPyPI..."
    if [ -n "$TWINE_PASSWORD" ]; then
        twine upload --repository testpypi --username __token__ --password "$TWINE_PASSWORD" dist/*
    else
        twine upload --repository testpypi dist/*
    fi
    echo ""
    echo "Uploaded to TestPyPI!"
    echo "Test installation with:"
    echo "  pip install --index-url https://test.pypi.org/simple/ background-remover-api"
else
    echo ""
    echo "Uploading to PyPI..."
    if [ -n "$TWINE_PASSWORD" ]; then
        twine upload --username __token__ --password "$TWINE_PASSWORD" dist/*
    else
        twine upload dist/*
    fi
    echo ""
    echo "Uploaded to PyPI!"
    echo "Install with:"
    echo "  pip install background-remover-api"
fi

