FROM python:3.11-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app /app/app
COPY wait-for-it.sh /wait-for-it.sh

# Stage 2 with NGINX
FROM python:3.11-slim

RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local /usr/local
COPY --from=builder /app /app
COPY --from=builder /wait-for-it.sh /wait-for-it.sh

# Copy NGINX config
COPY nginx.conf /etc/nginx/nginx.conf

# Run both Flask and NGINX
WORKDIR /app
CMD ["sh", "-c", "flask --app app run --host=127.0.0.1 --port=5000 & nginx -g 'daemon off;'"]
