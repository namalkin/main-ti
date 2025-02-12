FROM itzg/minecraft-server:latest

RUN apt-get update && apt-get install -y wget gcc make && \
    wget https://github.com/Tiiffi/mcrcon/archive/refs/tags/v0.7.1.tar.gz && \
    tar -xzf v0.7.1.tar.gz && \
    cd mcrcon-0.7.1 && \
    make && \
    cp mcrcon /usr/local/bin && \
    cd .. && \
    rm -rf mcrcon-0.7.1 v0.7.1.tar.gz && \
    apt-get remove -y wget gcc make && \
    apt-get autoremove -y && \
    apt-get clean

CMD ["start"]