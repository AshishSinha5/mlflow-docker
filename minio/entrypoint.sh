#!/bin/sh

# Start the MinIO server in the background
minio server /data &

# Wait for the MinIO server to be healthy
while ! curl -s http://localhost:${MINIO_PORT}/minio/health/live; do
  echo 'Waiting for MinIO to start...'
  sleep 1
done

# Run the create_bucket.py script
python /scripts/create_bucket.py

# Wait for the MinIO server process to keep the container running
wait