#!/bin/bash

validacion(){

    if [[ $# -ne 1 ]]
    then 
        echo "O script $0 precisa que se indique o nome do ficheiro de combates";
        exit 0;
    elif  [[ ! -f $1 ]] 
    then
        echo "ERRO!! O ficheiro de $1 non existe ";
        exit;
    elif  [[ ! -r $1 ]] 
    then
        echo "ERRO!! O ficheiro de $1 non ten permisos de lectura";
        exit 0;
  
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
      loitador01="$(echo $linea | cut -d ';' -f1)";
      vida01=$(echo $linea      | cut -d ';' -f2)  ; 
      loitador02=$(echo $linea  | cut -d ';' -f3);  
      vida02=$(echo $linea      | cut -d ';' -f4) ; 

      echo -e "\nProcesando $linea"; 

      preparacion  "${loitador01}" "${loitador02}" 
      combate "${loitador01}" "${vida01}"  "${loitador02}"  "${vida02}"


    done < $1

   echo -e "Todos os combates finalizados";
}


preparacion() {
   RED='\033[0;31m';
   NC='\033[0m' ;
   Purple='\033[0;35m'; 
   trap "echo -e ' \t Saltando a preparación' && break" INT TSTP
   echo -e "No seguinte combate ${RED} ${1} ${NC} enfrontarase a ${Purple} ${2} ${NC} !!! Quen gañará?"; 

   for ((i=3; i>=1; i--))
   do
      echo "O combate comezará en  $i segundos, agarde..."
      sleep 1
   done

}
 
combate() { 
   trap '' INT TSTP

   #Params: $1=$loitador01 $2=$vida01 $3=$loitador02 $4=$vida02
   loitador01=$1;
   vida01=$2;
   loitador02=$3;
   vida02=$4;

   VERDE='\033[42m';
   NC='\033[0m' ;

   echo -e "${VERDE} Que comece o combate!!! ${NC} ";
   echo "$loitador01 pelexa contra $loitador02 ";

   while [ $vida01 -gt 0 -a $vida02 -gt 0 ]
   do
      ataque01=$(shuf -i 1-20 -n 1);
      ataque02=$(shuf -i 1-20 -n 1);
      vida02="$(($vida02-$ataque01))"
      vida01="$(($vida01-$ataque02))"

      echo -e "$loitador01 ataca a $loitador02 e fai $ataque01 puntos de dano."
      if [ $vida02 -gt 0 ]
         then   echo -e "$loitador02 recibe o golpe. Quédanlle $vida02 puntos de vida."
         else   echo -e "$loitador02  perdeu o combate.";
                break;
      fi
      sleep 1;

      echo -e "$loitador02 ataca a $loitador01 e fai $ataque02 puntos de dano."
      if [ $vida01 -gt 0 ]
         then   echo -e "$loitador01 recibe o golpe. Quédanlle $vida01 puntos de vida."
         else   echo -e "$loitador01  perdeu o combate.";
                break;
      fi
      sleep 1;
      
   done

   echo -e "Combate finalizado\n"

}

#-------------------------------------
#--------------MAIN-------------------
#-------------------------------------


validacion $@
principal $@

