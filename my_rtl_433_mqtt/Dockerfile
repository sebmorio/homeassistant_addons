# Étape 1 : Image de base Alpine + dépendances
FROM alpine:latest AS build

# Installation des outils nécessaires à la compilation
RUN apk add --no-cache \
    build-base \
    git \
    cmake \
    libusb-dev \
    librtlsdr-dev \
    mosquitto-clients

# Installation des dépendances nécessaires à l'exécution
RUN apk add --no-cache \
    libusb \
    librtlsdr \
    mosquitto-clients

# Définir la branche à récupérer (modifie si nécessaire)
ARG BRANCH=feat_ws6262

# Cloner ton fork et passer sur la branche
WORKDIR /usr/src
RUN git clone --depth 1 -b $BRANCH https://github.com/sebmorio/rtl_433.git rtl_433

# Compiler rtl_433
WORKDIR /usr/src/rtl_433
#RUN mkdir build && cd build && cmake .. && make -j$(nproc) && make install
RUN mkdir build && cd build && cmake .. && make && make install

# Copie d'un script de démarrage
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Exécution automatique
ENTRYPOINT ["/run.sh"]
#CMD [ "/run.sh" ]
