FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 LC_ALL=C.UTF-8 \
    ROS_DISTRO=jazzy

# 1. Locale & tools
RUN apt-get update && \
    apt-get install -y locales software-properties-common curl gnupg2 lsb-release && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

# 2. Add ROS 2 key & repo
RUN add-apt-repository universe && \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
      | gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
      http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" \
      > /etc/apt/sources.list.d/ros2.list

# 3. Update & upgrade
RUN apt-get update && apt-get upgrade -y

# 4. Install ROS 2, TurtleBot 4 desktop & simulator, Gazebo, dev tools
RUN apt-get install -y \
      ros-$ROS_DISTRO-desktop \
      ros-$ROS_DISTRO-dev-tools \
      python3-argcomplete \
      ros-$ROS_DISTRO-turtlebot4-desktop \
      ros-$ROS_DISTRO-turtlebot4-simulator \
      ros-$ROS_DISTRO-irobot-create-nodes \
      ros-gz-ignition-harmonic \
      ros-$ROS_DISTRO-gazebo-plugins \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 5. (Optional) Run official setup script
RUN curl -sSL \
    https://raw.githubusercontent.com/turtlebot/turtlebot4_setup/jazzy/scripts/turtlebot4_setup.sh \
    | bash

# 6. Shell & environment
SHELL ["/bin/bash", "-c"]
RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

CMD ["bash"]
