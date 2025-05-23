# Use lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY src/ .

# Expose port 5000 for Flask
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
