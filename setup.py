from setuptools import setup, find_packages, Extension

setup(
    name='pytest_plus_nuitka',
    version='4.2',
    packages=find_packages(),
    install_requires=[
        'pytest',
        'pytest-workflow',
    ],
    entry_points={
    'console_scripts': [
        'pytest_plus_nuitka = main:main',
    ],
},
)
