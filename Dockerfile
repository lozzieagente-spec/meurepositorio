FROM n8nio/n8n:latest

USER root

# Instalar FFmpeg
RUN apk add --no-cache ffmpeg

# Criar diretório para áudios
RUN mkdir -p /tmp/audio && chmod 777 /tmp/audio

USER node

# Environment variables
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=suasenha123
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http

# Usar comando correto do N8N
CMD ["node", "/usr/local/lib/node_modules/n8n/bin/n8n", "start"]
