# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy files
COPY app/ /app

# Install dependencies
RUN pip install --no-cache-dir fastapi uvicorn prometheus_client pydantic

# Expose port
EXPOSE 8000

# Start app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
