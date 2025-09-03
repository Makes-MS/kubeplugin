FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache bash curl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

COPY scripts/kubeplugin.bash /app/
RUN chmod +x /app/kubeplugin.bash

CMD ["bash", "/app/kubeplugin.bash", "default", "pods"]