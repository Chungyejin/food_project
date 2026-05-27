# Usa uma imagem base oficial do Python
FROM python:3.9-slim

LABEL author="Yejin Chung" \
      version="1.0" \
      description="DockerFile para rodar o backend do Projeto Comida"


      # Instala dependências do sistema necessárias para o Prolog
RUN apt-get update && apt-get install -y \
    swi-prolog \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# Instala as dependências Python
RUN pip install --no-cache-dir flask pyswip

# Expõe a porta 5001
EXPOSE 5001

# Rodar a aplicação
CMD ["python", "main.py"]