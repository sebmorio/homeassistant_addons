# Utilisation de Debian comme base
FROM debian:latest

# Installer les dépendances nécessaires
RUN apt update && apt install -y \
    git cmake build-essential libusb-1.0-0-dev pkg-config \
    librtlsdr-dev \
    && rm -rf /var/lib/apt/lists/*

ENV TZ=Europe/Paris
RUN echo $TZ > /etc/timezone && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -y bash jq

# Définir la branche à récupérer (modifie si nécessaire)
ARG BRANCH=feat_ws6262

# Cloner ton fork et passer sur la branche
WORKDIR /usr/src
RUN git clone --depth 1 -b $BRANCH https://github.com/sebmorio/rtl_433.git rtl_433

# Compiler rtl_433
WORKDIR /usr/src/rtl_433
#RUN mkdir build && cd build && cmake .. && make -j$(nproc) && make install
RUN mkdir build && cd build && cmake .. && make && make install

# Copie des fichiers de configuration
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Exécution automatique
CMD [ "/run.sh" ]
