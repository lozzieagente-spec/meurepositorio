FROM n8nio/n8n:latest

USER root

# Instalar dependências do sistema
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    git \
    curl \
    build-base

# Instalar Whisper com flag de bypass
RUN pip3 install --no-cache-dir \
    --break-system-packages \
    --timeout=1000 \
    openai-whisper \
    torch \
    torchaudio

# Criar diretórios necessários
RUN mkdir -p /tmp/audio /tmp/whisper
RUN chmod 777 /tmp/audio /tmp/whisper
RUN chown -R node:node /tmp/audio /tmp/whisper

# Limpeza
RUN apk del build-base
RUN pip3 cache purge

USER node

# Variáveis de ambiente
ENV N8N_DISABLE_PRODUCTION_MAIN_PROCESS=false
ENV WHISPER_CACHE_DIR=/tmp/whisper
ENV N8N_RUNNERS_ENABLED=true

CMD ["n8n", "start"]
