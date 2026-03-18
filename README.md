These instructions assume a consistent execution location.

### Generate Diff Reports for Collections

1. Download the script [artifact_diff.sh](https://github.com/opencadc-metadata-curation/collection_auditor/blob/main/audit_tools/artifact_diff.sh) 
to the working directory.
1. Make the file executable: `chmod u+x artifact_diff.sh`
1. Retrieve the Docker image: `docker pull opencadc/artifact-diff:3.13-slim`
1. Execute the script: `./artifact_diff.sh`.
   1. If there are no parameters, the script will check all collections.
   1. To check a specific collection: `./artifact_diff.sh EUCLID.Q1`
   1. The output files end up in the directory `./collectionAuditing` in the execution location. Every time the script is executed, these files are over-written.
   1. A directory `./config` is also created in the execution location. There are four configuration files in this directory.
      If the message `Collection <collection name> not found in collections configuration file.` appears, the collection name and other information needs to be added to these files.

### Summarize Diff Reports for All Collections
1. Download the script [summarize_artifact_diff.sh](https://github.com/opencadc-metadata-curation/collection_auditor/blob/main/audit_tools/summarize_artifact_diff.sh) 
to the working directory.
1. Download the script [collectionAuditingSummary.sh](https://github.com/opencadc-metadata-curation/collection_auditor/blob/main/audit_tools/collectionAuditingSummary.sh) 
to the working directory.
1. Make the file executable: `chmod u+x summarize_artifact_diff.sh`
1. Retrieve the Docker image: `docker pull opencadc/artifact-diff:3.13-slim`
1. Execute the script: `./summarize_artifact_diff.sh`.
1. The file `artifactDiff_summary.tsv` is created in the directory `./collectionAuditing`. This file is overwritten every time the script is run.
