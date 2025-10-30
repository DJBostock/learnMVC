# build the image
# docker build -t xampp-container .

# run the container
# docker run -d -p 8080:80 xampp-container

FROM ubuntu:22.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y wget
RUN wget "https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.2.12/xampp-linux-x64-8.2.12-0-installer.run/download" -O xampp-linux-x64-8.2.12-0-installer.run
RUN chmod +x xampp-linux-x64-8.2.12-0-installer.run
RUN ./xampp-linux-x64-8.2.12-0-installer.run --mode unattended
RUN rm xampp-linux-x64-8.2.12-0-installer.run

# Copy project files into container
COPY ./project/ /opt/lampp/htdocs/

# Expose HTTP port
EXPOSE 80

# Start XAMPP services
CMD ["bash", "-c", "/opt/lampp/lampp start && tail -f /dev/null"]