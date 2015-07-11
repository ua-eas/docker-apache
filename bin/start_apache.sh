#!/bin/bash

#copy the certs in from the shared volume
cp /security/base/shibboleth/sp-cert.pem /etc/shibboleth/
cp /security/base/shibboleth/sp-key.pem /etc/shibboleth/
chown _shibd:_shibd /etc/shibboleth/sp-cert.pem
chown _shibd:_shibd /etc/shibboleth/sp-key.pem

service shibd start

/usr/sbin/apache2ctl -D "FOREGROUND"
