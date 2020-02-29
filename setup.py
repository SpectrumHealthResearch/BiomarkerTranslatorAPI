#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from setuptools import setup

setup(name="BiomarkerTranslatorAPI",
      version="0.0",
      author="Paul W. Egeler, M.S., GStat",
      author_email="paul.egeler@spectrumhealth.org",
      description="NCATS Biomarker Translator API",
      url="https://github.com/SpectrumHealthResearch/BiomarkerTranslatorAPI",
      license="GPL-3",
      package_dir={"BiomarkerTranslatorAPI": "src"},
      packages=["BiomarkerTranslatorAPI"],
      install_requires=[
          'flask',
          'flask_restful',
          'pymysql',
          'python-dotenv',
      ],
      keywords=["biomarker", "translational medicine", "API"],
      python_requires=">=3.5")
