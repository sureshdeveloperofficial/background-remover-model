# PyPI Upload Guide

This guide will help you upload the `background-remover-api` package to PyPI.

## Prerequisites

1. **PyPI Account**: Create an account at [pypi.org](https://pypi.org/account/register/)
2. **TestPyPI Account** (recommended for testing): Create an account at [test.pypi.org](https://test.pypi.org/account/register/)
3. **Install build tools**:
   ```bash
   pip install --upgrade build twine
   ```

## Step 1: Update Package Information

Before uploading, make sure to update the following files with your information:

1. **pyproject.toml**:
   - Update `authors` with your name and email
   - Update `project.urls` with your repository URLs

2. **setup.py**:
   - Update `author` and `author_email`
   - Update `url` with your repository URL

## Step 2: Build the Package

Navigate to the project root directory and build the package:

```bash
cd /home/webnox/Desktop/background-remover-model
python -m build
```

This will create:
- `dist/background_remover_api-1.0.0.tar.gz` (source distribution)
- `dist/background_remover_api-1.0.0-py3-none-any.whl` (wheel distribution)

## Step 3: Test on TestPyPI (Recommended)

First, test your package on TestPyPI to ensure everything works:

```bash
# Upload to TestPyPI
twine upload --repository testpypi dist/*

# You'll be prompted for:
# - Username: your TestPyPI username
# - Password: your TestPyPI password (or API token)
```

After uploading, test the installation:

```bash
pip install --index-url https://test.pypi.org/simple/ background-remover-api
```

## Step 4: Upload to PyPI

Once you've tested on TestPyPI and everything works:

```bash
# Upload to PyPI
twine upload dist/*

# You'll be prompted for:
# - Username: your PyPI username
# - Password: your PyPI password (or API token)
```

**Note**: For security, it's recommended to use an API token instead of your password:
1. Go to [pypi.org/manage/account/](https://pypi.org/manage/account/)
2. Create an API token
3. Use `__token__` as username and the token as password

## Step 5: Verify Installation

After uploading, verify the package is available:

```bash
pip install background-remover-api
```

## Updating the Package

When you need to update the package:

1. **Update version** in both `pyproject.toml` and `setup.py`
2. **Build again**:
   ```bash
   python -m build
   ```
3. **Upload again**:
   ```bash
   twine upload dist/*
   ```

## Troubleshooting

### Common Issues

1. **Package name already exists**: Choose a different name or check if you own the existing package
2. **Version already uploaded**: Increment the version number
3. **Build errors**: Make sure all dependencies are properly specified
4. **Import errors**: Verify the package structure and `__init__.py` files

### Checking Package Contents

Before uploading, you can check what will be included:

```bash
# List contents of the source distribution
tar -tzf dist/background_remover_api-1.0.0.tar.gz

# List contents of the wheel
unzip -l dist/background_remover_api-1.0.0-py3-none-any.whl
```

## Additional Resources

- [PyPI Documentation](https://packaging.python.org/en/latest/guides/distributing-packages-using-setuptools/)
- [Twine Documentation](https://twine.readthedocs.io/)
- [Python Packaging Guide](https://packaging.python.org/)

