FROM ros:noetic-robot-focal

RUN useradd -m -u 1000 default-user && \
    echo "default-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget

RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list && \
    wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add - && \
    apt-get install -y --no-install-recommends \
    gazebo11

COPY --chmod=755 docker/idle.bash /idle.bash
