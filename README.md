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


## Depuración inalámbrica

### Linux

1. Conecte su dispositivo Android a través de USB antes de abrir el contenedor de desarrollo.
2. Conecte su dispositivo a través de USB y asegúrese de que la depuración esté habilitada, luego ejecute:

```sh
adb tcpip 5555
```

3. Encuentre la dirección IP de su dispositivo, vaya a Configuración > Wi-Fi > Avanzado > Dirección IP en su dispositivo o ejecute `adb shell netcfg`.
4. Conéctese al dispositivo usando la dirección IP con el siguiente comando:

```sh
adb connect xxx.xxx.x.x
```

5. Desconecte su dispositivo del USB y proceda con la depuración inalámbrica.

> Solución de problemas: puede intentar matar el demonio adb en su máquina host usando el comando `abd kill-server` y luego su contenedor debería tener acceso para enumerar el dispositivo.

##  Depuracion USB
### Windows y Mac OS

> En estos dos sistemas operativos no es posible compartir tu dispositivo USB con el contenedor, por lo que debemos recurrir a una forma alternativa.

Primero, deberá tener las herramientas de plataformas que contienen ADB instaladas en su máquina host y puede descargarlas [aquí] (https://developer.android.com/studio/releases/platform-tools#downloads)

1. Conecte su dispositivo a través de USB y asegúrese de que la depuración esté habilitada, luego ejecútelo en su máquina host:

```sh
adb tcpip 5555
```

2. Busque la dirección IP de su dispositivo, vaya a Configuración > Wi-Fi > Avanzado > Dirección IP en su dispositivo o ejecute `adb shell netcfg`.
3. Conéctese al dispositivo usando la dirección IP con el siguiente comando:

```sh
adb connect xxx.xxx.x.x
```

4. Desconecte el USB y proceda a abrir el contenedor dev en vscode.
5. Ahora, dentro de su contenedor, ejecute el comando del paso 3 con la misma dirección IP.
6. Verifique si el contenedor puede enumerar ahora su dispositivo usando `adb devices`.

## Dummy Login - Ejemplo de Acceso de Prueba
Este proyecto incluye un login de prueba denominado "dummy login" que permite el acceso a la aplicación utilizando datos de prueba predefinidos. A continuación se proporcionan detalles sobre cómo utilizarlo:

Credenciales de Acceso
Email: dummy@example.com
Contraseña: 123