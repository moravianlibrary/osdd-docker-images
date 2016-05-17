FROM tomcat:8

MAINTAINER Martin Rumanek <martin@rumanek.cz>

ENV REFRESHED_AT 2015-04-21
ENV OAIPROVIDER_DOWNLOAD_URL http://ftp-devel.mzk.cz/proai/oaiprovider.war
ENV JAVA_OPTS -Xms1536m -Xmx4096m

WORKDIR $CATALINA_HOME/webapps
RUN curl -sL "$OAIPROVIDER_DOWNLOAD_URL" -o oaiprovider.war \
    && unzip oaiprovider.war -d oaiprovider \
    && rm -rf oaiprovider-1.2.2 oaiprovider.zip docs examples manager host-manager oaiprovider.war

WORKDIR $CATALINA_HOME
ADD proai.properties $CATALINA_HOME/webapps/oaiprovider/WEB-INF/classes/proai.properties
ADD log4j.xml $CATALINA_HOME/webapps/oaiprovider/WEB-INF/classes/log4j.xml

EXPOSE 8080
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["catalina.sh", "run"]

