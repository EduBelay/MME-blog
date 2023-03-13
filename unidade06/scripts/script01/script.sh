#!/bin/bash 

#01 Recibe como primeiro parámetro unha letra, que debe ser ou ben o “s” 
# ou ben o “c”. De non ser así, advertirá disto nunha mensaxe de erro e sairá.

#02 Recibe como segundo parámetro un nome de ficheiro, e comproba que isto sexa así. 
# De non cumprirse, amosará nunha liña como usar o script e sairá.
validacion01(){
    if [[ $# -ne 2 ]]
    then 
        echo "O script $0 precisa que se indiquen os dous parametros, o primeiro un caracter s ou c e o segundo un nome dun ficheiro";
        exit;
    else
        case $1 in
            "s")
             #echo "OK s"
            ;;
            "c")
             #echo "OS c"
            ;;
            *)
            echo "ERRO!! O script recolle como primeiro parámetro unha letra que e s ou c ";
            exit;
            ;;
        esac 
    fi
}

# 03 Comproba se o devandito ficheiro existe. 
# De ser así, amosará a mensaxe de erro pertinente e sairá.
validacion03(){
    if [[ ! -a $2 ]] 
    then
        echo "Non existe o ficheiro $2, debe indicar no primeiro parametro unha letra s ou c e no segundo a ruta dun ficheiro";
        exit;
    #else
        #echo "existe o ficheiro"
    fi
}

#04 Obtén as velocidades de subida e baixada da conexión a Internet. 
# Se o primeiro parámetro era “c”, debería executar speedtest-cli sen parámetros 
# e logo analizar a saída sintacticamente para obter ditos valores. 
# Se o primeiro parámetro era “s”, debería executar speedtest-cli coa opción --simple e logo analizar dita saída.
paso04(){
 case $1 in
    "s")
       
        resultado=$(speedtest-cli);
        #echo ">> DEBUG s"
        #resultado="Retrieving speedtest.net configuration... Testing from Garrafone Portugal (199.199.199.6)... Retrieving speedtest.net server list... Selecting best server based on ping... Hosted by PTV Telecom (Madrid) [488.97 km]: 2.261 ms Testing download speed................................................................................ Download: 102.21 Mbit/s Testing upload speed...................................................................................................... Upload: 2.97 Mbit/s";
        #echo $resultado; #findebug


        #Analise e volcado ao ficheiro (Tarefa 5)
        descarga=$(echo $resultado | cut -d ':' -f 3 | cut -d ' ' -f2);
        echo $descarga >$2;

        subida=$(echo $resultado | cut -d ':' -f 4 | cut -d ' ' -f2) ;
        echo $subida >>$2;
        #Tarefa 6
        comprobarvelocidade $descarga $subida

      
    ;;
    "c")
       resultado=$(speedtest-cli --simple) ;
       #echo ">>DEBUG c" ;
       #resultado="Ping: 23.301 ms Download: 286.06 Mbit/s Upload: 1.57 Mbit/s";
       #echo $resultado; #fin debug

       #Analise e volcado ao ficheiro (Tarefa 5)
       descarga=$(echo $resultado | cut -d ' ' -f 5);
       echo $descarga >$2;

       subida=$(echo $resultado | cut -d ' ' -f 8);
       echo $subida >>$2;

       #Tarefa 6
       comprobarvelocidade $descarga $subida
       
    ;;
    *)
    echo "ERRO!! ";
    exit;
    ;;
esac 

}

#6 - Comprobará se a velocidade de subida é inferior ou non a 3 
# (aquí por simplicidade imos asumir que a velocidade sempre ben en Mbps). 
# Se o valor é maior que 3, o programa amosará a mensaxe "A túa conexión é rápida".
# En caso contrario, amosará a mensaxe "A túa conexión é lenta".
comprobarvelocidade(){
    #Param 1 - Velocidade de descarga
    #Param 2 - Velocidade de subida
    

    resultado="$(echo "$2>3" | bc)";

    if [[ $resultado -eq 1 ]]
    then 
        echo "A túa conexión é rápida"
    else
       echo "A túa conexión é lenta"
    fi
}



validacion01 $1 $2
validacion03 $1 $2
paso04 $1 $2 
