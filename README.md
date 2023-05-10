# Movie Admin

Este es un archivo README.md que te guiará a través del proceso de instalación de la aplicación Flutter dockerizada.

## Requisitos previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- Docker: [Instrucciones de instalación de Docker](https://docs.docker.com/get-docker/)

## Pasos para crear la imagen docker:

1. Clona este repositorio en tu máquina local:
git clone [<URL_DEL_REPOSITORIO>](https://github.com/NicolasSebastianEstigarribia/Flutter-MovieAdmin/)

2. Accede al directorio de la aplicación:
cd <directorio_de_la_aplicacion>

3. Construye la imagen Docker de la aplicación:
docker build -t movie .

## Inicia un contenedor Docker basado en la imagen que acabas de construir:

1. Instala la extensión "Remote - Containers" en Visual Studio Code. Puedes hacerlo yendo a la pestaña de extensiones (el ícono de cuatro cuadrados en la barra lateral izquierda) y buscando "Remote - Containers" en el marketplace de extensiones de VSC. Haz clic en Instalar y luego en Recargar para activar la extensión.

2. Abre la carpeta del proyecto en Visual Studio Code. Asegúrate de que la carpeta contenga un archivo llamado Dockerfile que defina cómo se construye la imagen del contenedor.

3. Haz clic en el ícono verde en la esquina inferior izquierda de Visual Studio Code. Esto abrirá el menú de comandos.

4. En el menú de comandos, busca y selecciona Remote-Containers: Reopen in Container (Reabrir en contenedor). Esto iniciará el proceso de construcción del contenedor basado en la imagen especificada en el Dockerfile.

5. Espera a que se complete la construcción del contenedor. Durante este proceso, VSC descargará la imagen base del contenedor y ejecutará los comandos definidos en el Dockerfile.

6. Una vez que se complete la construcción, VSC abrirá una nueva ventana dentro del contenedor. Esta ventana estará configurada para trabajar dentro del entorno del contenedor, lo que significa que podrás ejecutar comandos y editar archivos como si estuvieras trabajando directamente en el contenedor.

¡Y eso es todo! Ahora estás trabajando dentro del contenedor basado en la imagen especificada, y puedes realizar tareas de desarrollo y pruebas dentro de ese entorno aislado.

## Problemas y preguntas

Si tienes algún problema o pregunta sobre la instalación de la aplicación, por favor, abre un issue en este repositorio y te ayudaremos a resolverlo.

_Dependencies_

When you want to run the `flutter-android-emulator` entrypoint your host must support KVM and have `xhost` installed.

### flutter (default)

Executing e.g. `flutter help` in the current directory (appended arguments are passed to flutter in the container):

```shell
docker run --rm -e UID=$(id -u) -e GID=$(id -g) --workdir /project -v "$PWD":/project matspfeiffer/flutter help
```

When you don't set the `UID` and `GID` the files will be owned by `G-/UID=1000`.

### flutter (connected usb device)

Connecting to a device connected via usb is possible via:

```shell
docker run --rm -e UID=$(id -u) -e GID=$(id -g) --workdir /project -v "$PWD":/project --device=/dev/bus -v /dev/bus/usb:/dev/bus/usb movie devices
```

### flutter-android-emulator

To achieve the best performance we will mount the X11 directory, DRI and KVM device of the host to get full hardware acceleration:

```shell
xhost local:$USER && docker run --rm -ti -e UID=$(id -u) -e GID=$(id -g) -p 42000:42000 --workdir /project --device /dev/kvm --device /dev/dri:/dev/dri -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -v "$PWD":/project --entrypoint flutter-android-emulator  movie
```





