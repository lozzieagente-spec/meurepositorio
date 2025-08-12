FROM n8nio/n8n:latest

USER root

# Instalar dependências básicas
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    git

# Instalar apenas Whisper (ele instala suas próprias dependências)
RUN pip3 install --break-system-packages --no-cache-dir openai-whisper

# Criar diretórios
RUN mkdir -p /tmp/audio && chmod 777 /tmp/audio

USER node

# Environment variables
ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=false
ENV WHISPER_CACHE_DIR=/tmp/whisper

CMD ["n8n", "start"]
