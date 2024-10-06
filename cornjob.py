from crontab import CronTab
import os

# Path to your Python script
script_path = '/path/to/script.py'
# Path to Python executable
python_path = '/path/to/python3'

# Initialize a cron tab
cron = CronTab(user=True)  # Use 'user=True' for the current user

# Create a new cron job
job = cron.new(command=f'{python_path} {script_path}')
job.minute.every(10)  # Run every 10 minutes

# Add the job to the cron tab
cron.write()

print("Cron job created successfully!")
