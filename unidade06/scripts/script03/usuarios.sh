#!/bin/bash 
# Lembra comprobar que o ficheiro de entrada para a opción de importación é un ficheiro regular con permiso de lectura 
# e que o ficheiro de saída para a opción de exportación non exista.
validacion01(){
    if [[ $# -ne 2 ]]
    then 
        echo "O script $0 precisa que se indique unha das opcións de entrada -i ou -e acompañado dun ficheiro";
    else
        case $1 in
            "-i")
                #Comprobamos que existe o ficheiro e temos permiso de lectura. 
                if [ -r $2 -a  -f $2 ] 
                    then
                         importacion $1 $2  ;
                    else
                        echo "ERRO!! O ficheiro de IMPORTACIÓN non existe ou non ten permisos de lectura";
                fi
            ;;
            "-e")
               # Comprobamos que o ficheiro de saída para a opción de exportación non exista.
               if [ -a $2 ]
               then
                         echo "ERRO!! O ficheiro de EXPORTACIÓN  XA existe $2";
               else
                        exportacion $1 $2 ;
               fi
            ;;
            *)
            echo "ERRO!!  A opción $1 non está implementada para  $0  ";
            exit;
            ;;
        esac 
    fi
}
importacion(){
    #param-1 : Nome do ficheiro a importar. 
    echo "EXEC IMPORTACION";

    #Amañar o ficheiro por se incorpora o final de linha 
    echo "" | tee -a  $2 > /dev/null #Forzamos unha nova linha
    sed -i '/^$/d' $2                #Borramos as linhas en branco 
  
    line1=1   #Flag para controlar a linha 1

    while IFS= read -r linea
    do
      if [[ $line1 -eq 1 ]] #Saltamos a primeira linha1
      then
        line1=0
        continue
      fi

      login=$(echo $linea | tr -d '"'|cut -d ',' -f1) 
      contrasinal=$(echo $linea| tr -d '"'| cut -d ',' -f2) 
      nome=$(echo $linea | tr -d '"' | cut -d ',' -f3) 
      directorio=$(echo $linea | tr -d '"' | cut -d ',' -f4) 
      consola=$(echo $linea | tr -d '"' | cut -d ',' -f5) 
      sudo useradd -m -d $directorio -c "$nome" -s $consola $login 
            #echo "sudo useradd -m -d $directorio -c "$nome" -s $consola $login "
      echo $login:$contrasinal | sudo chpasswd
    done < $2 
    
 
}

#OPCIÓN DE EXPORTACIÓN
exportacion(){
    echo "EXEC EXPORTACION";
    echo "\" LOGIN \",\" CONTRASINAL \",\" NOME \",\" HOME_DIR \",\" SHELL \"" > $2
    getent passwd  | awk -F':' '{print "\""$1"\""",""\"""?""\""",""\""$5"\""",""\""$6"\""",""\""$7"\""}' >> $2
}

#----------------------------
#--     MAIN
#----------------------------

validacion01 $1 $2 
