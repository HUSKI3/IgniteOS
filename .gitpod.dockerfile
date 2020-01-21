FROM gitpod/workspace-full

RUN sudo apt-get update \
 && sudo apt-get install -y wget make gawk gcc bc bison flex xorriso libelf-dev libssl-dev
 && sudo rm -rf /var/lib/apt/lists/*
