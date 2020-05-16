# Start from a core stack version
FROM python:3.6.5-slim
#jupyter/datascience-notebook:latest

# Meta-data
LABEL maintainer="Raul Samayoa <raul.g.samayoa@gmail.com>"

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install from requirements.txt file
RUN apt-get update && apt-get -y update && \
    pip install --upgrade pip && \
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt 
#pip3 -q install pip –upgrade && \


# Make port 8777 available to the world outside this container
EXPOSE 8777

# Run jupyter when container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8777", "--no-browser", "--allow-root"]

#docker build -t raul/workflow .
#docker run -p 8777:8777 raul/workflow