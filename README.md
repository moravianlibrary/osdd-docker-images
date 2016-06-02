[![Stories in Ready](https://badge.waffle.io/moravianlibrary/kramerius-docker.png?label=ready&title=Ready)](https://waffle.io/moravianlibrary/kramerius-docker)
# kramerius-docker
 Docker balíček pro Kramerius https://github.com/ceskaexpedice/kramerius a další balíčky s komponenty, nutnýni pro jeho běh

[![Join the chat at https://gitter.im/moravianlibrary/kramerius](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/moravianlibrary/kramerius?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Pro spuštění je nutné mít nainstalované dvě komponenty:
- http://docs.docker.com/installation/debian/
- http://docs.docker.com/compose/install/

Pro provoz Krameria je nutné pustit více kontejnerů:
- kramerius
- solr
- fedora
- několik provozních databází postgres (dvě pro fedoru, jednu pro Krameria)
- imageserver
- nginx pro imageserver
- memcached

Tyto kontejnery je nutné za pomocí nástroje docker-compose spojit.

vytvoříme soubor [docker-compose.yml](https://github.com/moravianlibrary/kramerius-docker/blob/master/docker-compose.yml)

Komponenty `fcrepo` a `solr` potřebují k běhu (alespoň minimální) data. Složky s daty se připojují v `docker-compose.yml` pod klíčem `volumes`.

*v případě, že chcete v Dockeru provozovat pouze imageserver použijte  [docker-compose.yml](https://github.com/moravianlibrary/kramerius-docker/blob/master/imageserver/docker-compose.yml)*

poté příkazem `docker-compose up -d`  pustíme.

Konfigurace je popsaná [zde](https://github.com/moravianlibrary/kramerius-docker/wiki/Konfigurace-Krameria)
