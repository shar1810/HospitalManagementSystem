# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the app will run on
EXPOSE 5000

# Set environment variables for Flask to run in production mode
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Command to run the Flask app
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
