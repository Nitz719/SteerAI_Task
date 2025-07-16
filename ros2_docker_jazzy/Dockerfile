FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV ROS_DISTRO=jazzy

RUN apt-get update && apt-get install -y \
    locales \
    software-properties-common \
    curl \
    gnupg \
    lsb-release \
 && locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
 && add-apt-repository universe \
 && curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
      http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" \
      > /etc/apt/sources.list.d/ros2.list \
 && curl -sSL https://packages.osrfoundation.org/gazebo.gpg | gpg --dearmor -o /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg \
 && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] \
      http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" \
      > /etc/apt/sources.list.d/gazebo-stable.list \
 && apt-get update \
 && apt-get install -y \
      ros-$ROS_DISTRO-desktop \
      ros-dev-tools \
      python3-argcomplete \
      gz-harmonic \
      ros-$ROS_DISTRO-turtlebot4-simulator \
      ros-$ROS_DISTRO-irobot-create-nodes \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> /root/.bashrc

#CMD ["bash"]
# Default command: source ROS and launch TurtleBot4 Gazebo simulation
CMD ["bash", "-c", "source /opt/ros/jazzy/setup.bash && ros2 launch turtlebot4_gz_bringup turtlebot4_ignition.launch.py"]