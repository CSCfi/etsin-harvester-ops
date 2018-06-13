if [ "$USER" != "apache" ]; then
    echo "Run this as apache"
    exit 1
fi

cd /usr/local/ckan/pyenv/src
source /usr/local/ckan/pyenv/bin/activate
pip install -e 'git+https://github.com/CSCfi/metax-ckan.git@ckan-2.6.2#egg=ckan'
pip install -r /usr/local/ckan/pyenv/src/ckan/requirements.txt
pip install -e 'git+https://github.com/CSCfi/metax-ckanext-harvest.git@v1.1.0#egg=ckanext-harvest'
pip install -r /usr/local/ckan/pyenv/src/ckanext-harvest/pip-requirements.txt
pip install -e 'git+https://github.com/CSCfi/metax-ckanext-oaipmh.git@master#egg=ckanext-oaipmh'
pip install -r /usr/local/ckan/pyenv/src/ckanext-oaipmh/requirements.txt
pip install -e 'git+https://github.com/CSCfi/metax-ckanext-etsin.git@master#egg=ckanext-etsin'
pip install -r /usr/local/ckan/pyenv/src/ckanext-etsin/requirements.txt
pip install -e 'git+https://github.com/CSCfi/metax-ckanext-spatial.git@master#egg=ckanext-spatial'
pip install -r /usr/local/ckan/pyenv/src/ckanext-spatial/pip-requirements.txt
