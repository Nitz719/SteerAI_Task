FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV ROS_DISTRO=jazzy
ENV WEBOTS_HOME=/usr/local/webots

# 1. Install base tools and locale
RUN apt-get update && \
    apt-get install -y \
        locales \
        software-properties-common \
        curl \
        gnupg2 \
        lsb-release && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# 2. Add ROS 2 apt repository and key
RUN add-apt-repository universe && \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | \
    gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
    http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2.list

# 3. Install ROS 2 Jazzy, Webots ROS 2 bridge, and dependencies
RUN apt-get update && \
    apt-get install -y --fix-missing \
        ros-$ROS_DISTRO-desktop \
        ros-dev-tools \
        python3-argcomplete \
        ros-$ROS_DISTRO-webots-ros2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# 4. Optional: create a placeholder for Webots if not bind-mounted
RUN mkdir -p /usr/local/webots

# 5. Source ROS 2 in shell
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc && \
    echo "export WEBOTS_HOME=$WEBOTS_HOME" >> ~/.bashrc

# 6. Default command
CMD ["bash"]
