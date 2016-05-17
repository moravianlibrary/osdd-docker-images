### OAIPROVIDER

Tento obraz slouží k provozování OAI nad Krameriem.

Spouští se příkzem:

docker run -v /data/oaiprovider-data:/oaiprovider-data  -t -i --name="oaiprovider" -d -p 8080:8080 \
-e "FEDORA_URL=http://fedora.mzk.cz/fedora" \
-e "FEDORA_USER=login do Fedory" \
-e "FEDORA_PASS=hesloDoFedory" \
-e "FEDORA_JDBC_URL=jdbc Fedory" \
-e "FEDORA_JDBC_USER=login do databáze Fedory" \
-e "FEDORA_JDBC_PASS=heslo do databáze Fedory" \
-u root moravianlibrary/oaiprovider /init.sh

