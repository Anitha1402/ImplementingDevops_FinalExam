# Use an official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy app and requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Expose the application port
EXPOSE 5000

# Run the app using Gunicorn
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5000", "app:app"]
