from setuptools import setup

reqs = [
    "loguru>=0.6.0",
]

test_pkgs = ["pytest"]
develop_pkgs = ["jupyterlab"]

setup(
    name="your_pkg_name",
    packages=["your_pkg_name"],
    package_dir={"": "src"},
    version="0.0.1",
    python_requires=">3.7",
    description="Python package for whatever.",
    url="https://github.com/your_repo",
    install_requires=reqs,
    extras_require={"develop": develop_pkgs, "test": test_pkgs},
    include_package_data=True,
)
