FROM yigitkonur/n8n-ffmpeg:latest

# Configurações específicas
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin  
ENV N8N_BASIC_AUTH_PASSWORD=suasenha123
ENV N8N_HOST=localhost
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https

# Comando padrão
CMD ["n8n", "start"]
