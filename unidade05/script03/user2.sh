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

    echo "TODO IMPORTACION";


  
    primeira=1
    while IFS= read -r line
    do
      if [[ $primeira -eq 1 ]] #Saltamos a primeira liña
      then
        primeira=0
        continue
      fi
      echo $line;

      user=$(echo $line | tr -d '"' | cut -d ',' -f1) #Variable user: valor primeira columna.
      echo "usuario: $user";
      contrasinal=$(echo $line | tr -d '"' | cut -d ',' -f2) #Variable contrasinal: valor segunda columna.
      nome=$(echo $line | tr -d '"' | cut -d ',' -f3) # Variable nome: valor terceira columna.
      consola=$(echo $line | tr -d '"' | cut -d ',' -f4) #Variable consola: valor cuarta columna.
      directorio=$(echo $line | tr -d '"' | cut -d ',' -f5) #Variable dir_home: valor quinta columna.

     # sudo useradd -m -d $directorio -c "$nome" -s $consola $user #Comando para crear os usuarios cifrando o password 
     #  echo $user:$contrasinal | sudo chpasswd
    done < $2 

     echo $line $user


 
}

exportacion(){
    echo "TODO EXPORTACION";
}
validacion01 $1 $2 