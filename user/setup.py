from setuptools import setup, find_packages
import os

setup(
    name=f"{os.environ.get('CUR_TEAM_PACKAGE_NAME')}",  #do not change
    version="2024.10.9",
    author="davide_gurrieri",
    author_email="gurrieri99@gmail.com",
    description="test demo",
    # python_requires=">=3.6.0",
    install_requires=["accelerate", "bitsandbytes"],  # ["matplotlib", "talib", "pylab", "numpy", "pandas", "baostock"]
    packages=find_packages(),
    include_package_data = True,
    platforms="any",
)