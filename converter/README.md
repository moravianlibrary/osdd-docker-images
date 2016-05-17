## Před spuštěním skriptu
Docker kontejner bude běžet na serveru editoru, takže se tam připojíme.

    $ ssh editor.staff.mzk.cz

Volume imageserveru je připojené na cestě `/mnt/imageserver/`

Např. obrázky pro import z Mikulovské knihovny jsou na cestě `/mnt/imageserver/other/bwe301/`

Je potřeba sledovat Oddíl `/var/lib/docker` při spuštění skriptu (příkazem `$ df -h`), tak aby na něm nedošlo místo.
    
Všechny kontejnery se vylistují příkazem

    $ sudo docker ps -a 

Logy z běžícího kontejneru se zobrazí takto (-f zařídí automatický update logu)

    $ sudo docker logs -f <název_kontejneru>


## Kontainer na konverziu obrazkov

**Podla prikazu s ktorym je kontainer spusteny skonvertuje vsetky jpegy alebo tify v adresari pripojenom do /data**

**Jpeg:**

    $ sudo docker run -d -v /some_directory/:/data moravianlibrary/converter /scripts/convertAllJpegs.sh

**Tiff:**

    $ sudo docker run -d -v /some_directory/:/data moravianlibrary/converter /scripts/convertAllTifs.sh

Kontainer umoznuje rekurzivnu konverziu v podadresaroch /data. Na to sluzi systemova premenna RECURSIVE_CONVERSION ktoru treba nastavit pri spusteni kontaineru na hodnotu 'true'. Pomocou premennej DEPTH_OF_RECURSION mozeme nastavit maximalnu hlbku rekurzie (vyzaduje cele kladne cislo)

**Priklad s rekurzivnim pruchodem:**

    $ sudo docker run  -e "RECURSIVE_CONVERSION=true" -e "DEPTH_OF_RECURSION=3" -d -v /some_directory/:/data moravianlibrary/converter /scripts/convertAllTifs.sh

**Příklad spuštění skriptu pro data z "Mikulova**

    $ sudo docker run -e "RECURSIVE_CONVERSION=true" -d -v /mnt/imageserver/other/bwe301:/data moravianlibrary/converter /scripts/convertAllJpegs.sh

