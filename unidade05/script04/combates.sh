#!/bin/bash

validacion(){
    if [[ $# -ne 1 ]]
    then 
        echo "O script $0 precisa que se indique o nome do ficheiro de combates";
        exit;
    elif  [-r $1  ]
    then
        echo "ERRO!! O ficheiro de >$1< non existe ou non ten permisos de lectura";
        exit;
    else
         #Amañar o ficheiro por se incorpora o final de linha 
         echo "" | tee -a  $1 > /dev/null #Forzamos unha nova linha
         sed -i '/^$/d' $1                #Borramos as linhas en branco 
    fi
}

# Unha función preparacion, que recibe os nomes dos dous combatentes, 
# anuncia os seus nomes e fai unha conta atrás de 3 segundos. 
# Se o usuario preme CTRL+C nalgún punto da función, esta conta 
# se abortará, deixando ver a mensaxe “Saltando preparación” na pantalla e
# pasará directamente ao combate.

principal() {
   while IFS= read -r linea
   do
      

      loitador01=$(echo $linea | tr -d '"'|cut -d ';' -f1) ;
      vida01=$(echo $linea| tr -d '"'| cut -d ';' -f2)  ; 

      loitador02=$(echo $linea | tr -d '"' | cut -d ';' -f3);  
      vida02=$(echo $linea | tr -d '"' | cut -d ';' -f4) ; 

      echo -e "\nProcesando $linea"; 
      preparacion $loitador01 $loitador02
      combate $loitador01 $vida01 $loitador02 $vida02


     # echo -e  "$loitador01  $vida01\n"
     # echo -e  "$loitador02 $vida02 \n"

    done < $1

   echo -e "Todos os combates finalizados";
}


preparacion() {
   trap "echo -e ' \t Saltando a preparación' && break" INT TSTP
   echo -e "No seguinte combate $1 se enfrontará a $2!!! Quen gañará?"; 

   for ((i=3; i>=1; i--))
   do
      echo "O combate comezará en  $i segundos, agarde..."
      sleep 1
   done

}
 
combate() { 
   echo "Que comece o combate!!!";
   echo "$1 pelexa contra $3 $2 $4";

   #ataque
   #contador

}

#-------------------------------------
#--------------MAIN-------------------
#-------------------------------------


validacion $@
principal $@


# trap '' INT TSTP
# for ((i=0; i<=1; i++))
# do
#    echo "pensando"
#    sleep 1
# done