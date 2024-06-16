FROM python:3.9-slim

# Install MinIO and curl
RUN apt-get update && apt-get install -y wget curl && \
    wget https://dl.min.io/server/minio/release/linux-amd64/minio -O /usr/local/bin/minio && \
    chmod +x /usr/local/bin/minio
    
# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entrypoint script and create_bucket.py
COPY entrypoint.sh /scripts/
COPY create_bucket.py /scripts/

# Set the entrypoint
ENTRYPOINT ["/scripts/entrypoint.sh"]