#
# Ubuntu Dockerfile
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  apt-get update && \
  apt-get install -y curl git vim wget && \
  rm -rf /var/lib/apt/lists/* && \
  useradd -ms /bin/bash app

# Add files.
ADD hello.txt /home/app/hello.txt

# become user app
USER app

# Set environment variables.
ENV HOME /home/app

# Define working directory.
WORKDIR /home/app

# Define default command.
CMD ["bash"]
