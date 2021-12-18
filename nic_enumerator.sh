#!/bin/bash
#nic.ar Enumerator
#globals
function enumerateFromJson(){
    let DATE=$(date +%Y%m%d)
    for year in $(seq 2016 2019); do
        for mo in $(seq -f "%02g" 1 12); do
            for dey in $(seq -f "%02g" 1 31); do
            let sign=$(echo "$year$mo$dey")
                #echo $sign
                if [ $DATE -gt $sign ]; then
                        curl -i -s -k  -X 'POST'     -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:51.0) Gecko/20100101 Firefox/51.0' -H 'Referer: https://www.boletinoficial.gob.ar/' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'X-Requested-With: XMLHttpRequest'     -b 'BORA=170594570.20480.0000; bbbbbbbbbbbbbbb=IBBPHNPAJCGDLLHKLNKHPJFMFKACIDKJPBBEKKHODOKDDDLHDLLHMMOGIKMAGFIANCKKOPFIDBLJPFFDONGEAFPKJGBNIJJAHLHMPPOGOOFGAEFDDLGKJHDOOEDCAMLO; TS01d76151=0148a1cd4863aeb25d6c315b927c28904f80e0b129132711436e28433020952758001b6f78c75c6795cc99c8ca8156e1dd4d1b28c26b109abd26c1291450c05b2f4920fd9a; _ga=GA1.3.522918058.1485820689; _gat=1'     --data-binary "nombreSeccion=cuarta&subCat=all&offset=1&itemsPerPage=500&fecha=$sign&idSesion="     'https://www.boletinoficial.gob.ar/secciones/secciones.json' | sed -e "s/}.{/\n/g" | awk -F\" {'print $8'} | grep "\."
                fi
            done    
        done
    done;

}

function main(){
    enumerateFromJson
}

main
