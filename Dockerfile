FROM i386/ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /

RUN apt update && \
    apt -y install wget unzip && \
    mkdir -pm755 /etc/apt/keyrings && \
    wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
    wget -NP /etc/apt/sources.list.d/  https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources && \
    apt update && \
    apt -y install --install-recommends winehq-stable && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh .
RUN wget -O /COFECHA.ZIP https://www.ltrr.arizona.edu/pub/dpl/COFECHA.ZIP && \
    unzip /COFECHA.ZIP && \
    rm -f /COFECHA.ZIP && \
    chmod a+x /COFECHA.EXE /entrypoint.sh && \
    wine /COFECHA.EXE || true

ENTRYPOINT ["/entrypoint.sh"]
