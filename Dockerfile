FROM n8nio/n8n:latest

USER root

# Apenas o essencial
RUN apk add --no-cache python3 py3-pip ffmpeg
RUN pip3 install --break-system-packages openai-whisper
RUN mkdir -p /tmp/audio && chmod 777 /tmp/audio

USER node
CMD ["n8n", "start"]
