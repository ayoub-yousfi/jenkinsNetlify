# Use the official Nginx image
FROM nginx:latest

# Copy your HTML, CSS, JS files to the Nginx default directory
COPY ./index.html

# Expose the default Nginx port
EXPOSE 80
