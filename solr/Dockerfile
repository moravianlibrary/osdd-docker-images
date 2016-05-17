FROM tomcat:8

MAINTAINER Martin Rumanek <martin@rumanek.cz>

ENV REFRESHED_AT 2014-03-24

# SOLR
RUN curl -sL https://github.com/ceskaexpedice/kramerius/releases/download/v5.1.0/Installation-5.1.zip -o /tmp/installation.zip
ENV SOLR_HOME /usr/local/solr
RUN unzip /tmp/installation.zip -d /tmp/
RUN cp /tmp/Installation-5.1/solr.war $CATALINA_HOME/webapps/solr.war && \
    cp -r /tmp/Installation-5.1/solr $SOLR_HOME

ENV SOLR_HOME /usr/local/solr
ENV JAVA_OPTS -Djava.awt.headless=true -Dfile.encoding=UTF8 -XX:MaxPermSize=256m -Xms1024m -Xmx3072m  -Djava.security.auth.login.config=$JAAS_CONFIG -Dsolr.solr.home=$SOLR_HOME


EXPOSE 8080

