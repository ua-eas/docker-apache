# create yum repo
cat <<EOF>/etc/yum.repos.d/security\:shibboleth.repo 
[security_shibboleth]
name=Shibboleth
type=rpm-md
baseurl=http://download.opensuse.org/repositories/security:/shibboleth/RHEL_6/
gpgcheck=1
gpgkey=http://download.opensuse.org/repositories/security:/shibboleth/RHEL_6/repodata/repomd.xml.key
enabled=1
EOF

#install shib and dependencies
yum -y install shibboleth

# grab ua specific deployment files
wget https://shibboleth.arizona.edu/sp-files/UA-IdP.pem -O /etc/shibboleth/UA-IdP.pem
wget https://shibboleth.arizona.edu/sp-files/shibboleth2.xml -O /etc/shibboleth/shibboleth2.xml
wget https://shibboleth.arizona.edu/sp-files/attribute-map.xml -O /etc/shibboleth/attribute-map.xml
wget https://shibboleth.arizona.edu/sp-files/attribute-policy.xml -O /etc/shibboleth/attribute-policy.xml

sed -i -e 's:sp.example.org:ka-tools.mosaic.arizona.edu:g' /etc/shibboleth/shibboleth2.xml