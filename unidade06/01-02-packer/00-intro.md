

# Introducción a Packer
## Instalación en windows
```ps
    winget install packer
```

## Instalación en Linux
Sigue as instruccións da [documentación oficial](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)

```bash
$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
$ sudo apt-get update && sudo apt-get install packer
```

## Verifica a instalación 
```bash
    packer -v
```

# Construir a imaxen de VM para vagrant 

https://galvarado.com.mx/post/packer-automatiza-la-creacion-de-cualquier-tipo-de-imagen-de-maquina-virtual/ 