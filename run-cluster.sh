#!/bin/bash

# Stop and remove containers, volumes, and orphaned containers
echo "Stopping and removing containers, volumes, and orphaned containers..."
sudo docker-compose down --volumes --remove-orphans

# Pull the latest images
echo "Pulling the latest images..."
sudo docker-compose pull

# Recreate and start the containers in detached mode
echo "Recreating and starting containers..."
sudo docker-compose up -d --force-recreate

# Print status message
echo "Docker Compose containers have been successfully recreated and started."
