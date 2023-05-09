# Movie Admin

Este es un archivo README.md que te guiará a través del proceso de instalación de la aplicación Flutter dockerizada.

## Requisitos previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- Docker: [Instrucciones de instalación de Docker](https://docs.docker.com/get-docker/)

## Pasos de instalación

Sigue los siguientes pasos para instalar y ejecutar la aplicación Flutter dockerizada:

1. Clona este repositorio en tu máquina local:
git clone <URL_DEL_REPOSITORIO>

2. Accede al directorio de la aplicación:
cd <directorio_de_la_aplicacion>

3. Construye la imagen Docker de la aplicación:
docker build -t movie .

4. Inicia un contenedor Docker basado en la imagen que acabas de construir:
docker run -d -p 8080:8080 movie


Esto ejecutará la aplicación en un contenedor Docker y mapeará el puerto 8080 de tu máquina local al puerto 8080 del contenedor.

5. Abre tu navegador web y visita `http://localhost:8080` para ver y utilizar la aplicación Flutter.

¡Y eso es todo! Ahora deberías tener la aplicación Flutter dockerizada ejecutándose en tu máquina local. Si deseas detener la aplicación, puedes usar el siguiente comando:
docker stop movie

## Problemas y preguntas

Si tienes algún problema o pregunta sobre la instalación de la aplicación, por favor, abre un issue en este repositorio y te ayudaremos a resolverlo.





