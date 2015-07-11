#install shib and dependencies
apt-get install -y libapache2-mod-shib2

# grab ua specific deployment files
wget https://shibboleth.arizona.edu/sp-files/UA-IdP.pem -O /etc/shibboleth/UA-IdP.pem
wget https://shibboleth.arizona.edu/sp-files/shibboleth2.xml -O /etc/shibboleth/shibboleth2.xml
wget https://shibboleth.arizona.edu/sp-files/attribute-map.xml -O /etc/shibboleth/attribute-map.xml
wget https://shibboleth.arizona.edu/sp-files/attribute-policy.xml -O /etc/shibboleth/attribute-policy.xml

sed -i -e 's:sp.example.org:ka-tools.mosaic.arizona.edu:g' /etc/shibboleth/shibboleth2.xml
