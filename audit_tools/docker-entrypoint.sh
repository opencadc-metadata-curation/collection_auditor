#!/bin/bash
mkdir -p ${PWD}/config

for f_name in caomCollections.tsv caomSiMappings.tsv caomSites.tsv caomMonitoringConfig.xlsx; do
    if [[ ! -e ${PWD}/config/${f_name} ]]; then
        echo "Refresh ${f_name}"
        cp /usr/local/.config/${f_name} ${PWD}/config/
    fi
done

exec "${@}"
