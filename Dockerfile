FROM ubuntu:20.04

ENV UID=1000
ENV GID=1000
ENV USER="developer"
ENV JAVA_VERSION="11"
#Version 9.0
ENV ANDROID_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip"
ENV ANDROID_VERSION="33"
ENV ANDROID_BUILD_TOOLS_VERSION="33.0.2"
ENV ANDROID_ARCHITECTURE="x86_64"
ENV ANDROID_SDK_ROOT="/home/$USER/android"
ENV ANDROID_HOME="/home/$USER/android"
#Flutter
ENV FLUTTER_CHANNEL="stable"
ENV FLUTTER_VERSION="3.7.12"
ENV FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.12-stable.tar.xz"
ENV FLUTTER_HOME="/home/$USER/flutter"
ENV FLUTTER_WEB_PORT="8090"
ENV FLUTTER_DEBUG_PORT="42000"
ENV FLUTTER_EMULATOR_NAME="flutter_emulator"
#PATH
ENV PATH="$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/platforms:$FLUTTER_HOME/bin:$PATH"

# Instalar todas las dependencias
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update \
  && apt-get install --yes --no-install-recommends openjdk-$JAVA_VERSION-jdk curl unzip sed git bash xz-utils libglvnd0 ssh xauth x11-xserver-utils libpulse0 libxcomposite1 libgl1-mesa-glx sudo apt-transport-https software-properties-common \
  && rm -rf /var/lib/{apt,dpkg,cache,log}

# Crear usuario
RUN groupadd --gid $GID $USER \
  && useradd -s /bin/bash --uid $UID --gid $GID -m $USER \
  && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
  && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR /home/$USER


# Android SDK
RUN mkdir -p $ANDROID_SDK_ROOT \
  && mkdir -p /home/$USER/.android \
  && touch /home/$USER/.android/repositories.cfg \
  && curl -o android_tools.zip $ANDROID_TOOLS_URL \
  && unzip -qq -d "$ANDROID_SDK_ROOT" android_tools.zip \
  && rm android_tools.zip \
  && mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/tools \
  && mv $ANDROID_SDK_ROOT/cmdline-tools/bin $ANDROID_SDK_ROOT/cmdline-tools/tools \
  && mv $ANDROID_SDK_ROOT/cmdline-tools/lib $ANDROID_SDK_ROOT/cmdline-tools/tools \
  && yes "y" | sdkmanager "build-tools;$ANDROID_BUILD_TOOLS_VERSION" \
  && yes "y" | sdkmanager "platforms;android-$ANDROID_VERSION" \
  && yes "y" | sdkmanager "platform-tools" \
  && yes "y" | sdkmanager "emulator" \
  && yes "y" | sdkmanager "system-images;android-$ANDROID_VERSION;google_apis_playstore;$ANDROID_ARCHITECTURE"


# flutter    
RUN curl -o flutter.tar.xz $FLUTTER_URL \
  && mkdir -p $FLUTTER_HOME \
  && tar xf flutter.tar.xz -C /home/$USER \
  && rm flutter.tar.xz \
  && flutter config --no-analytics --enable-web \
  && flutter precache \
  && flutter doctor \
  && flutter emulators --create \
  && flutter update-packages

## Por si me da algun error.
RUN sdkmanager "cmdline-tools;latest"

#Acepto la licencia
RUN yes "y" | flutter doctor --android-licenses


COPY entrypoint.sh /usr/local/bin/
COPY chown.sh /usr/local/bin/
COPY flutter-android-emulator.sh /usr/local/bin/flutter-android-emulator
COPY flutter-web.sh /usr/local/bin/flutter-web
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]