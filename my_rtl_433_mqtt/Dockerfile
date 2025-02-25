# Etape 1 : Image de base + dependances
#ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.19
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:latest
FROM $BUILD_FROM as builder

# Installation des outils necessaires a la compilation
RUN apk add --no-cache \
    build-base \
    git \
    cmake \
    libusb-dev \
    librtlsdr-dev \
    jq \
    bash \ 
    python3 \
    py3-pip

# Installation des dependances necessaires a l'execution
RUN apk add --no-cache \
    libusb \
    librtlsdr \
    mosquitto-clients

# Definir la branche a recuperer (modifie si nécessaire)
ARG BRANCH=feat_ws6262

# Cloner ton fork et passer sur la branche
WORKDIR /usr/src
RUN git clone -b $BRANCH https://github.com/sebmorio/rtl_433.git rtl_433

# Compiler rtl_433
WORKDIR /usr/src/rtl_433
RUN mkdir build && cd build && cmake .. && make -j$(nproc) && make install

# Copie d'un script de démarrage
RUN pip install --no-cache-dir --prefer-binary paho-mqtt

COPY run.sh /run.sh
RUN chmod +x /run.sh       

# Execution automatique
ENTRYPOINT ["/run.sh"]
