# BiomarkerTranslatorAPI

NCATS Biomarker Translator API

## Setup for Developers

This project uses `virtualenv` to manage packages. There is a script that
will install `virtualenv` and all packages. Run this the first time you clone
the repo.

```bash
source init.sh
```

Afterward, if you deactivate your session or log out of bash, you can get
reactivate your virtualenv using the following command.

```bash
source flask/bin/active
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

## WSGI

Currently, I am planning the production WSGI to be implemented with
[`mod_wsgi`](https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/)
since I am most experienced with Apache web servers. This is not required for
the prototype phase, but will be a consideration as development progresses.

## References

Documentation and walkthroughs down below:

- [Flask Documentation](https://flask.palletsprojects.com/en/1.1.x/)
- [Flask `mod_wsgi` Documentation](https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/)
- [Flask-RESTful Documentation](https://flask-restful.readthedocs.io/en/latest/)
- [Flask SQLAlchemy Documentation](https://flask-sqlalchemy.palletsprojects.com/en/2.x/)
