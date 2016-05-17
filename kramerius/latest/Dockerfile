FROM tomcat:8-jre8

MAINTAINER Martin Rumanek <martin@rumanek.cz>

ENV REFRESHED_AT 2015-07-09
ENV JDBC_DRIVER_DOWNLOAD_URL http://jdbc.postgresql.org/download/postgresql-9.3-1103.jdbc4.jar

## install packages
RUN apt-get -y  update && \
apt-get -y install wget unzip xmlstarlet curl less htop


# download binaries
RUN wget --no-verbose https://github.com/ceskaexpedice/kramerius/releases/download/v5.1.0/Installation-5.1.zip -O /tmp/installation.zip && \
    wget --no-verbose https://github.com/ceskaexpedice/kramerius/releases/download/v5.1.0/Editors-5.1.0.zip -O /tmp/editors.zip && \
    unzip /tmp/installation.zip -d /tmp/

RUN curl -sL http://ftp-devel.mzk.cz/kramerius/master/kramerius/editor.war -o  $CATALINA_HOME/webapps/editor.war && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/master/kramerius/rightseditor-5.1.0.war -o  $CATALINA_HOME/webapps/rightseditor.war && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/master/kramerius/search.war -o  $CATALINA_HOME/webapps/search.war && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/master/kramerius/security-core.jar -o  $CATALINA_HOME/lib/security-core.jar && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/master/kramerius/client.war -o  $CATALINA_HOME/webapps/client.war


RUN curl -sL "$JDBC_DRIVER_DOWNLOAD_URL" -o $CATALINA_HOME/lib/postgresql-9.3-1103.jdbc4.jar
ADD search.xml $CATALINA_HOME/conf/Catalina/localhost/search.xml
ADD rightseditor.xml $CATALINA_HOME/conf/Catalina/localhost/rightseditor.xml
ADD editor.xml $CATALINA_HOME/conf/Catalina/localhost/editor.xml

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

