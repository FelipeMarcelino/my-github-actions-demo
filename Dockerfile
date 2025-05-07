# Base image (Python 3.11 recommended)
FROM python:3.11-slim-buster

# Set working directory
WORKDIR /app

# Copy requirements first (for layer caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy entire project
COPY . .

RUN pytest test_hello.py

# Environment variables (if needed)
ENV PYTHONUNBUFFERED=1

# Expose port (if your app uses networking)
EXPOSE 8000

# Command to run (update to match your entrypoint)
CMD ["python", "hello.py"]
