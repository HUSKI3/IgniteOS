FROM gitpod/workspace-full

RUN sudo apt-get update 
RUN sudo apt-get install -y wget make gawk gcc bc bison flex xorriso libelf-dev libssl-dev
RUN sudo rm -rf /var/lib/apt/lists/*
