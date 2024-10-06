# Use the official Python image as a base
FROM python:3.10-slim

# Install cron and pip packages
RUN apt-get update && apt-get install -y cron \
    && pip install --no-cache-dir requests

# Set the working directory
WORKDIR /app

# Copy the Python script into the container
COPY script.py .

# Create a crontab file to run the script every minute
RUN echo "* * * * * python /app/script.py >> /var/log/cron.log 2>&1" > /etc/cron.d/my-cron-job

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/my-cron-job

# Apply the cron job
RUN crontab /etc/cron.d/my-cron-job

# Create the log file for cron
RUN touch /var/log/cron.log

# Run the command on container startup
CMD ["cron", "-f"]
