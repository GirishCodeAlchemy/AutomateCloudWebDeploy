FROM nginx:latest

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the web application files to the container
COPY html /usr/share/nginx/html
COPY assets /usr/share/nginx/html/assets
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

# Expose the port Nginx will run on
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]