FROM moravianlibrary/kramerius:base

RUN curl -sL http://ftp-devel.mzk.cz/kramerius/5.3.1_mzkgrafika/search.war -o $CATALINA_HOME/webapps/search.war && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/5.3.1_mzkgrafika/security-core.jar -o $CATALINA_HOME/lib/security-core.jar && \
    curl -sL http://ftp-devel.mzk.cz/kramerius/5.3.1_mzkgrafika/client.war -o $CATALINA_HOME/webapps/client.war
