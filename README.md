# BiomarkerTranslatorAPI

NCATS Biomarker Translator API

## Setup for Developers

This project uses `virtualenv` to manage packages. There is a script that
will install `virtualenv` and all packages. Run this the first time you clone
the repo.

```bash
source make_pyenv.sh
```

Afterward, if you deactivate your session or log out of bash, you can get
reactivate your virtualenv using the following command.

```bash
source pyenv/bin/active
```

## Prototype Phase KPIs

Develop APIs to support the following functions (only limit to liver/breast
cancers in the first segment). In phase 1, we will demonstrate a few examples as
proof of concept. In phase 2, we will continue to update the dataset.

| Route                | Description                                     |
|:---------------------|:------------------------------------------------|
| /drug                | List all drug biomarkers                        |
| /biomarker           | List all related drugs and diseases             |
| /disease             | List all related drugs and their biomarkers     |
| /patient             | List all OCTAD patients with a given biomarker  |

## Reference

[Flask-RESTful Documentation](https://flask-restful.readthedocs.io/en/latest/)
