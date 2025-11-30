from setuptools import setup, find_packages
from pathlib import Path

# Read the contents of README file
this_directory = Path(__file__).parent
long_description = (this_directory / "README.md").read_text(encoding="utf-8")

setup(
    name="background-remover-model",
    version="1.0.1",
    author="sureshshanmugasundaram",
    author_email="sureshdeveloperofficial@gmail.com",
    description="A FastAPI-based API for removing backgrounds from images and videos using backgroundremover",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/sureshdeveloperofficial/background-remover-model",
    packages=find_packages(where="backend"),
    package_dir={"": "backend"},
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: Python :: 3.12",
        "Topic :: Multimedia :: Graphics",
        "Topic :: Software Development :: Libraries :: Python Modules",
    ],
    python_requires=">=3.10",
    install_requires=[
        "fastapi>=0.104.1",
        "uvicorn[standard]>=0.24.0",
        "python-multipart>=0.0.6",
        "backgroundremover>=0.2.9",
        "numpy<2.0.0",
        "Pillow>=8.1.1,<10.0.0",
        "celery>=5.3.4",
        "redis>=5.0.1",
        "python-dotenv>=1.0.0",
        "aiofiles>=23.2.1",
        "pydantic>=2.0.0",
    ],
    extras_require={
        "dev": [
            "pytest>=7.0.0",
            "pytest-asyncio>=0.21.0",
            "black>=23.0.0",
            "flake8>=6.0.0",
        ],
    },
    keywords="background-removal image-processing video-processing fastapi backgroundremover",
    include_package_data=True,
)

