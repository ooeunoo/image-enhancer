from setuptools import setup, find_packages

setup(
    name="image-enhancer",
    version="0.1.1",  # 여기서 버전을 변경합니다
    packages=find_packages(),
    install_requires=[
        "opencv-python",
        "numpy",
        "Pillow",
        "requests",
    ],
    author="Your Name",
    author_email="your.email@example.com",
    description="A package for enhancing images with various filters and adjustments",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/image-enhancer",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
    include_package_data=True,
    package_data={
        '': ['README.md', 'LICENSE'],
    },
    exclude_package_data={
        '': ['publish.sh'],
    },
)