FROM moravianlibrary/kramerius:base

RUN curl -sL http://ftp-devel.mzk.cz/kramerius/mzkgrafika/search.war -o $CATALINA_HOME/webapps/search.war && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/mzkgrafika/security-core.jar -o $CATALINA_HOME/lib/security-core.jar && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/mzkgrafika/client.war -o $CATALINA_HOME/webapps/client.war

ENV TOMCAT_USER tomcat
ENV TOMCAT_UID 8983
RUN groupadd -r $TOMCAT_USER && \
  useradd -r -u $TOMCAT_UID -g $TOMCAT_USER $TOMCAT_USER
RUN  chown -R $TOMCAT_USER:$TOMCAT_USER  $CATALINA_HOME
RUN chmod -R ugo+rwX $CATALINA_HOME
USER $TOMCAT_USER

