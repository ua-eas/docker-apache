FROM easksd/base

RUN \
  apt-get update && \
  apt-get install -y apache2 && \
  apt-get install -y libapache2-mod-auth-cas && \
  apt-get clean

#Copy in the our apache2.conf
COPY ./conf/apache2.conf  apache2.conf

#Copy in the our custom auth_cas.conf
COPY ./conf/auth_cas.conf /etc/apache2/mods-available/auth_cas.conf

#Enable mod_proxy
RUN \
  a2enmod rewrite \
    proxy \
    proxy_http

# Install Shibboleth
COPY ./bin/install_shib.sh /install_shib.sh
RUN chmod +x /install_shib.sh && \
  /install_shib.sh && \
  rm install_shib.sh

#Copy the startup script
COPY ./bin/start_apache.sh /start_apache.sh

EXPOSE 80

CMD ["/start_apache.sh"]
