# ----- Stage 1: Builder -----
  FROM python:3.11-slim AS builder

  WORKDIR /app
  COPY requirements.txt .
  RUN python -m pip install --upgrade pip && \
      pip install --no-cache-dir -r requirements.txt
  
  # ----- Stage 2: Runtime -----
  FROM python:3.11-slim
  
  WORKDIR /app
  COPY --from=builder /usr/local /usr/local
  COPY . .
  
  EXPOSE 5000
  ENV FLASK_APP=app.py
  ENV FLASK_ENV=production
  
  CMD ["python", "app.py"]