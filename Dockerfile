FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache ffmpeg
RUN mkdir -p /tmp/audio && chmod 777 /tmp/audio

USER node

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=suasenha123

# Deixar o CMD padrão da imagem
