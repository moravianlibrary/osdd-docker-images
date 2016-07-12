FROM tomcat:8-jre8

MAINTAINER Martin Rumanek <martin@rumanek.cz>

ENV REFRESHED_AT 2015-07-09
ENV JDBC_DRIVER_DOWNLOAD_URL http://jdbc.postgresql.org/download/postgresql-9.3-1103.jdbc4.jar

## install packages
RUN apt-get -y  update && \
apt-get -y install wget unzip xmlstarlet curl less htop vim mc


RUN cd /tmp && \
    wget --no-verbose https://github.com/ceskaexpedice/kramerius/releases/download/v5.1.0/Editors-5.1.0.zip && \
    wget --no-verbose https://github.com/ceskaexpedice/kramerius/releases/download/v5.1.0/Installation-5.1.zip && \
    unzip -j Editors-5.1.0.zip Editors-5.1.0/editor.war Editors-5.1.0/rightseditor.war -d $CATALINA_HOME/webapps/ && \
    unzip -j Installation-5.1.zip Installation-5.1/fedora/* -d /tmp/fedora

RUN curl -sL "$JDBC_DRIVER_DOWNLOAD_URL" -o $CATALINA_HOME/lib/postgresql-9.3-1103.jdbc4.jar
ADD search.xml $CATALINA_HOME/conf/Catalina/localhost/search.xml
ADD rightseditor.xml $CATALINA_HOME/conf/Catalina/localhost/rightseditor.xml
ADD editor.xml $CATALINA_HOME/conf/Catalina/localhost/editor.xml
ADD web.xml $CATALINA_HOME/conf/web.xml

# JAAS
ENV JAAS_CONFIG $CATALINA_HOME/conf/jaas.config
ADD jaas.conf $CATALINA_HOME/conf/jaas.config

ENV SOLR_HOME /usr/local/solr
ENV JAVA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF8 -XX:MaxPermSize=256m -Xms1024m -Xmx3072m  -Djava.security.auth.login.config=$JAAS_CONFIG -Dsolr.solr.home=$SOLR_HOME


RUN mkdir /root/.kramerius4/
ADD migration.properties /root/.kramerius4default/migration.properties
ADD indexer.properties /root/.kramerius4default/indexer.properties
ADD configuration.properties /root/.kramerius4default/configuration.properties
ADD client.properties /root/.kramerius4default/client.properties

ADD docker-entrypoint.sh /
ADD lp.xml /root/.kramerius4/lp.xml

# Increase Tomcat upload size limit
RUN sed -i -e "s/52428800/524288000/" \
     "$CATALINA_HOME//webapps/manager/WEB-INF/web.xml";

ADD server.xml $CATALINA_HOME/conf/
ADD rewrite.config $CATALINA_HOME/conf/Catalina/localhost/
ADD tomcat-users.xml /tmp/tomcat-users.xml
EXPOSE 8080
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["catalina.sh", "run"]