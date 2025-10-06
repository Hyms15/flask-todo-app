# ----- Stage 1: Builder -----
  FROM python:3.11-slim AS builder

  WORKDIR /app
  COPY requirements.txt .
  RUN python -m pip install --upgrade pip && \
      pip install --no-cache-dir -r requirements.txt
  
  
  # ----- Stage 2: Runtime -----
  FROM python:3.11-slim
  
  WORKDIR /app
  
  # Install curl for healthcheck
  RUN apt-get update && apt-get install -y --no-install-recommends curl && \
      rm -rf /var/lib/apt/lists/*
  
  COPY --from=builder /usr/local /usr/local
  COPY . .
  
  EXPOSE 5000
  
  ENV FLASK_APP=app.py
  ENV FLASK_ENV=production
  
  # ✅ Add Healthcheck here
  # This checks every 30 seconds if Flask is responding on port 5000
  HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD curl -f http://localhost:5000/todos || exit 1
  
  # Start the Flask app
  CMD ["python", "app.py"]
  