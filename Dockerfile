# Use the official nginx image from the Docker Hub
FROM nginx:alpine

# Copy the content of the html directory to the nginx html directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 to the outside world
EXPOSE 80

# Start nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
