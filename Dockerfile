# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Set the working directory in the container to /app
WORKDIR /app

# Copy all the script files from the host into the container's /app directory
COPY . .

# Install necessary packages (like 'procps' for logging and 'grep')
# We use -y to auto-confirm all prompts
RUN apt-get update && apt-get install -y procps coreutils grep

# Make all scripts executable
RUN chmod +x *.sh

# Define the command to run when the container starts
CMD ["bash", "main.sh"]
