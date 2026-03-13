FROM python:3.9-slim

WORKDIR /app

# Copiamos primero los requerimientos para aprovechar la caché de capas de Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto de la aplicación
COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
