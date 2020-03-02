# BiomarkerTranslatorAPI

NCATS Biomarker Translator API

## Table of Contents

* [Prototype Phase KPIs](#prototype-phase-kpis)
* [System Requirements](#system-requirements)
* [Developers' Corner](#developers-corner)
    * [Running the App](#running-the-app)
    * [Python Virtual Environment](#python-virtual-environment)
    * [Environment File](#environment-file)
    * [MySQL Schema](#mysql-schema)
    * [Apache WSGI](#apache-wsgi)
* [References](#references)

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

## System Requirements

- Python (>=3.5)
- MySQL server
- Apache web server

## Developers' Corner

### Running the App

To run the app in DEBUG mode, activate your virtual environment and
then run the app using `python3 -m src`. This will run the app on
localhost:5000. _DO NOT PUT IN PRODUCTION USING THIS METHOD_.

### Python Virtual Environment

This project uses `virtualenv` to manage packages. There is a script that
will install `virtualenv` and all packages. Run this the first time you clone
the repo.

```bash
source init.sh
```

Afterward, if you deactivate your session or log out of bash, you can
reactivate your virtualenv using the following command.

```bash
source flask/bin/active
```

### Environment File

Running _init.sh_ also creates a [.env](https://pypi.org/project/python-dotenv/)
template file. You will need to adjust the variables for your setup.
_Remember to keep this at mode 600 for security._

### MySQL Schema

Create your schema with _create_biomarker_schema.sql_. This is still in flux
as we nail down the specifics of the data model. Most likely, things will change
before production, keep your eye on changes to this file.

(Coming soon) The plan is to have a load-data script in either scala, R, python, or SQL, depending
on which programmer gets to the task first. There will be a _load_data.xyz_ and further
instructions in the near future.

### Apache WSGI

Currently, I am planning the production WSGI to be implemented with
[`mod_wsgi`](https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/)
since I am most experienced with Apache web servers. This is not required for
the prototype phase, but will be a consideration as development progresses.

## References

Documentation and walkthroughs down below:

- [Flask Documentation](https://flask.palletsprojects.com/en/1.1.x/)
- [Flask `mod_wsgi` Documentation](https://flask.palletsprojects.com/en/1.1.x/deploying/mod_wsgi/)
- [`mod_wsgi` Github Site](https://github.com/GrahamDumpleton/mod_wsgi)
- [Flask-RESTful Documentation](https://flask-restful.readthedocs.io/en/latest/)
