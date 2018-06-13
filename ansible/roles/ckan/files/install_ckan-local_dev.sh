#! /bin/bash

set -e

if [ "$USER" != "root" ]; then
    echo "Run this as root"
    exit 1
fi

for package in ckan ckanext-harvest ckanext-oaipmh ckanext-etsin ckanext-spatial; do
    cd /etsin/sources/$package
    /usr/local/ckan/pyenv/bin/python setup.py develop
done

cd /etsin/sources
su apache
source /usr/local/ckan/pyenv/bin/activate

pip install -r ckan/requirements.txt
pip install -r ckanext-harvest/pip-requirements.txt
pip install -r ckanext-oaipmh/requirements.txt
pip install -r ckanext-etsin/requirements.txt
pip install -r ckanext-spatial/pip-requirements.txt
