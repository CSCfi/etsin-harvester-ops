if [ "$#" -ne 3 ]
then
  echo "Give CKAN and extensions tag names."
  echo "'$0 <ckanext-etsin> <ckanext-oaipmh> <ckanext-spatial>'"
  echo "Example: '$0 v0.0.1 v0.0.1 v0.0.1'"
  exit 2
fi

cd /usr/local/ckan/pyenv/src
source /usr/local/ckan/pyenv/bin/activate

cd ckan/ && git fetch --all --tags --prune && git checkout ckan-2.6.2 && cd ..
cd ckanext-harvest/ && git fetch --all --tags --prune && git checkout v1.1.0 && cd ..
cd ckanext-etsin/ && git fetch --all --tags --prune && git checkout $1 && cd ..
cd ckanext-oaipmh/ && git fetch --all --tags --prune && git checkout $2 && cd ..
cd ckanext-spatial/ && git fetch --all --tags --prune && git checkout $3 && cd ..

cd /usr/local/ckan/pyenv/src

pip install --force-reinstall --upgrade --editable ./ckan/
pip install --requirement ckan/requirements.txt
pip install --force-reinstall --upgrade --editable ./ckanext-harvest/
pip install --requirement ckanext-harvest/pip-requirements.txt
pip install --force-reinstall --upgrade --editable ./ckanext-etsin/
pip install --requirement ckanext-etsin/requirements.txt
pip install --force-reinstall --upgrade --editable ./ckanext-oaipmh/
pip install --requirement ckanext-oaipmh/requirements.txt
pip install --force-reinstall --upgrade --editable ./ckanext-spatial/
pip install --requirement ckanext-spatial/pip-requirements.txt
