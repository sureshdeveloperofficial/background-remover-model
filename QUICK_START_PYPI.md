# Quick Start: Upload to PyPI

## Before You Start

1. **Update your information** in these files:
   - `pyproject.toml` - Update author name, email, and URLs
   - `setup.py` - Update author name, email, and URL

2. **Install build tools**:
   ```bash
   pip install --upgrade build twine
   ```

3. **Create PyPI accounts**:
   - Main PyPI: https://pypi.org/account/register/
   - TestPyPI (for testing): https://test.pypi.org/account/register/

## Quick Upload Steps

### Option 1: Using the Script (Recommended)

```bash
# Test on TestPyPI first
./build_and_upload.sh testpypi

# If successful, upload to real PyPI
./build_and_upload.sh pypi
```

### Option 2: Manual Steps

```bash
# 1. Build the package
python -m build

# 2. Check the package
twine check dist/*

# 3. Upload to TestPyPI (for testing)
twine upload --repository testpypi dist/*

# 4. Test installation from TestPyPI
pip install --index-url https://test.pypi.org/simple/ background-remover-api

# 5. Upload to real PyPI
twine upload dist/*
```

## After Upload

Install and test:
```bash
pip install background-remover-api
```

## Important Notes

- **Package name**: `background-remover-api` (check if it's available on PyPI)
- **Version**: Currently `1.0.0` - increment for updates
- **Dependencies**: All listed in `pyproject.toml` and `setup.py`
- **License**: MIT (update if needed)

## Troubleshooting

- **Name conflict**: Change package name in `pyproject.toml` and `setup.py`
- **Version conflict**: Increment version number
- **Build errors**: Check that all files are in correct locations
- **Upload errors**: Verify PyPI credentials

For detailed instructions, see `PYPI_UPLOAD.md`.

