#!/bin/bash
su apache <<'EOF'
. /usr/local/ckan/pyenv/bin/activate
/usr/local/ckan/pyenv/bin/paster --plugin=ckanext-harvest harvester run --config=/etc/etsin.ini >/dev/null 2>&1
sources=`/usr/local/ckan/pyenv/bin/paster --plugin=ckanext-harvest harvester sources --config=/etc/etsin.ini |grep "Source id:"|cut -c 12-`
for source in $sources;
do
    /usr/local/ckan/pyenv/bin/paster --plugin=ckanext-harvest harvester job_abort $source --config=/etc/etsin.ini >/dev/null 2>&1
done
/usr/local/ckan/pyenv/bin/paster --plugin=ckanext-harvest harvester job-all --config=/etc/etsin.ini >/dev/null 2>&1
/usr/local/ckan/pyenv/bin/paster --plugin=ckanext-harvest harvester run --config=/etc/etsin.ini >/dev/null 2>&1
EOF
