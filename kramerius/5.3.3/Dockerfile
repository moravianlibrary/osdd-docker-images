FROM moravianlibrary/kramerius:base

RUN curl -sL http://ftp-devel.mzk.cz/kramerius/5.3.3/search.war -o $CATALINA_HOME/webapps/search.war && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/5.3.3/security-core.jar -o $CATALINA_HOME/lib/security-core.jar && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/5.3.3/client.war -o $CATALINA_HOME/webapps/client.war
