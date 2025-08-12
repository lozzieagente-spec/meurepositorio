FROM n8nio/n8n:latest

USER root

# Instalar apenas FFmpeg (essencial)
RUN apk add --no-cache ffmpeg

# Criar diretório para áudios
RUN mkdir -p /tmp/audio && chmod 777 /tmp/audio

USER node

# Environment variables essenciais
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=suasenha123
ENV N8N_HOST=localhost
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

CMD ["n8n", "start"]
