#!/bin/bash 

mostrar_menu_inicial(){
    echo "0:Saír                        ";
    echo "1: Operacións con hardware    ";
    echo "2: Operacións de disco        ";

    echo "Introduza a opción desexada:  ";

}

escolla_menu_inicial(){

 case $1 in
    "0")
         exit;
    ;;


    "1")
         echo " 0: Saír                                            ";
         echo " 1: Ver un listado xeral do hardware con lshw       ";
         echo " 2: Ver información do hardware con hwinfo          ";
         echo " 3: Ver a información da CPU                        "; 
         echo " 4: Ver os buses PCI                                ";
         echo " 5: Ver os dispositivos SCSI                        "; 
         echo " 6: Ver os dispositivos USB                         "; 
         echo " 7: Ver os dispositivos de bloque                   ";
         echo " Introduza a opción desexada:                       ";
         read opcion;
         menu01 $opcion;
    ;;
    "2")
        echo " 0: Saír                                                 ";
        echo " 1: Ver o listado de particións con fdisk                ";
        echo " 2: Ver particións do disco duro e espazo libre con df   ";
        echo " 3: Ver memoria RAM e intercambio con free               ";
        echo " 4: Ver información de /proc                             ";
        echo " 5: Ver información dos dispositivos SATA                ";
        echo " Introduza a opción desexada:                            ";
        read opcion;
        menu02 $opcion;
    ;;
    *)
    echo "ERRO!! Opción non valida do menú ";
    exit;
    ;;
esac 

}

menu01(){
    case $1 in
     "0")
         echo " 0: Saír                                            ";
         exit;
     ;;
     "1")
         echo " 1: Ver un listado xeral do hardware con lshw      ";
         lshw -short
     ;;

     "2")
         echo " 2: Ver información do hardware con hwinfo          ";
         lshw -short
     ;;

      "3")
         echo " 3: Ver a información da CPU                        "; 
         lscpu -y
     ;;

    "4")
         echo " 4: Ver os buses PCI                                ";
         lspci 
     ;;
     "5")
         echo " 5: Ver os dispositivos SCSI                        "; 
        lsscsi
     ;;
    "6")
         echo " 6: Ver os dispositivos USB                         "; 
         lsusb
     ;;
    "7")
         echo " 7: Ver os dispositivos de bloque                   ";
         lsblk
     ;;

     *)
         echo "ERRO!! Opción non valida do menú ";
         exit;
    ;;
esac 

}



menu02(){
    case $1 in
     "0")
         echo " 0: Saír                                            ";
         exit;
     ;;
     "1")
         echo " 1: Ver o listado de particións con fdisk        ";
         sudo fdisk -l
     ;;

     "2")
         echo " 2: Ver particións do disco duro e espazo libre con df       ";
         df -h
     ;;

      "3")
         echo " 3: Ver memoria RAM e intercambio con free                       "; 
         free -t
     ;;

    "4")
         echo " 4: Ver información de /proc                             ";
         result=$(ls /proc/);
         echo $result;
         echo " Introduza o nome do arquivo sobre o que quere ver información: cpuinfo";
         read arquivoproc;
         cpu-info /proc/$arquivoproc



     ;;
     "5")
         echo " Ver información dos dispositivos SATA                      "; 
         echo "Listando os contidos de /dev que comezan por 'sd':";
         result=$(ls /dev/sd*);
         echo $result;

         echo "Introduza o nome do dispositivo do que quere ver información:"
         read  entrada;
         sudo hdparm /dev/$entrada -i
         #exit;
     ;;
  


    *)
        echo "ERRO!! Opción non valida do menú ";
        exit;
    ;;
esac 

}

# ------------------------------
# ---         MAIN           ---
# ------------------------------

mostrar_menu_inicial;
read opcion;
escolla_menu_inicial $opcion;