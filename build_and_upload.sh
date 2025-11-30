#!/bin/bash

# Script to build and upload the package to PyPI
# Usage: ./build_and_upload.sh [testpypi|pypi]

set -e

REPOSITORY=${1:-pypi}

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
    twine upload --repository testpypi dist/*
    echo ""
    echo "Uploaded to TestPyPI!"
    echo "Test installation with:"
    echo "  pip install --index-url https://test.pypi.org/simple/ background-remover-api"
else
    echo ""
    echo "Uploading to PyPI..."
    twine upload dist/*
    echo ""
    echo "Uploaded to PyPI!"
    echo "Install with:"
    echo "  pip install background-remover-api"
fi

