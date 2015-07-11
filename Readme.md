# Environment Variables
Apache requires that you set the global ServerName. This needs to be passed in as an environment variable called SERVER_NAME

# Volumes
This container assumes that it has a security container mounted which contains certificates, keys, and othe credential information.

# Command

The startup script is start_apache.sh. This script will copy in any required secure credentials or keys from the mounted /security directory and start shibboleth and apache.

# Docker Run Example
``` sh
$ docker run -d --name "ksd-tools-apache" -p 80:80 -e "SERVER_NAME=ksd-tools.mosaic.arizona.ed" -v /kuali-configs/security/tools/apache/:/security easksd/apache
```

This will start the Apache Docker container as a daemon process. It will run the default startup script which is:
``` sh
$ /start_apache.sh
```
