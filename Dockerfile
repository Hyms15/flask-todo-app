# ---------- Stage 1: builder ----------
    FROM python:3.11-slim AS builder

    WORKDIR /app
    RUN apt-get update && apt-get install -y --no-install-recommends build-essential
    
    COPY requirements.txt .
    RUN pip install --upgrade pip && pip install --prefix=/install -r requirements.txt
    
    
    # ---------- Stage 2: runtime ----------
    FROM python:3.11-slim
    
    WORKDIR /app
    COPY --from=builder /install /usr/local
    COPY . .
    
    # Healthcheck (see Story 5)
    HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
      CMD curl -f http://localhost:5000/todos || exit 1
    
    ENV FLASK_APP=app.py \
        FLASK_RUN_HOST=0.0.0.0 \
        PYTHONUNBUFFERED=1
    
    EXPOSE 5000
    CMD ["flask", "run"]
    