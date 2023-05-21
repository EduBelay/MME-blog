<h1>apt</h1>

# Tarefa 1
1. Busca a ferramenta Gimp: 
```apt search gimp```
2. Instalar a aplicación Gimp
   ```apt install gimp```

3. Desinstalar a aplicación Gimp
   ```apt remove gimp```

4. Eliminar calquera ficheiro de configuración do programa Gimp.
   ```apt purge gimp```
 
5. Actualizar a base de datos dos paquetes.
   ```apt update```

6. Actualizar os paquetes do sistema.
   ```apt upgrade```

7. Elimina os paquetes que non están completos ou non sexan precisos.
   ```apt clean```


# Tarefa 2

1. Que contido hai no directorio ```/var/cache/apt/archives```. Para que serve? 
    ```->Directorio no que se gardan os paquetes descargados con apt```
2. Explica  que fai o seguinte comando ```apt autoclean```
   ```-> Elimina os paquetes descargados en /var/cache/apt/archives```
3. ```sudo apt autoremove```, que fai? 
      ```->Borra os paquetes secundarios que se agregaron por necesidade doutro paquete que agora non é preciso. ``

4. ```sudo apt-cache pkgnames```, que fai?   
        ```-> Mostra os paquetes instalados no sistema operativo```





<footer>
<p style="float:left; width: 10%;">
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a>
</p>

<p style="float:left; width: 90%; text-align:center;">
Copyright © <a href="https://www.belay.gal">Pablo Belay Fernández, 2022 | www.belay.gal | </a>
<br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>
</p>
</footer>