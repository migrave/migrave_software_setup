FROM ros-kinetic-desktop:1.0

SHELL [ "/bin/bash", "-c" ]

# setting up NAOqi and NAO ROS packages
RUN apt-get update && apt-get install -y --no-install-recommends wget curl && \
    mkdir /naoqi && cd /naoqi && \
    wget https://community-static.aldebaran.com/resources/2.8.6/pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327.tar.gz && \
    wget https://community-static.aldebaran.com/resources/2.8.5/naoqi-sdk-2.8.5.10-linux64.tar.gz && \
    tar xzf naoqi-sdk-2.8.5.10-linux64.tar.gz && \
    tar xzf pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327.tar.gz && \
    mv pynaoqi-python2.7-2.8.6.23-linux64-20191127_152327 pynaoqi-python2.7-2.8.6.23 && \
    touch /root/.bashrc && \
    echo 'export PYTHONPATH=/naoqi/pynaoqi-python2.7-2.8.6.23/lib/python2.7/site-packages:$PYTHONPATH' >> /root/.bashrc && \
    apt-get install -y ros-$ROS_DISTRO-catkin \
                       ros-$ROS_DISTRO-driver-base \
                       ros-$ROS_DISTRO-move-base-msgs \
                       ros-$ROS_DISTRO-octomap \
                       ros-$ROS_DISTRO-octomap-msgs \
                       ros-$ROS_DISTRO-humanoid-msgs \
                       ros-$ROS_DISTRO-humanoid-nav-msgs \
                       ros-$ROS_DISTRO-camera-info-manager \
                       ros-$ROS_DISTRO-camera-info-manager-py \
                       ros-$ROS_DISTRO-nao-robot

# setting up Zyre and the ROPOD Zyre utilities
RUN sudo apt update && \
    sudo apt install -y python3-pip \
                        libtool \
                        autoconf \
                        automake && \
    pip3 install Cython \
                 ipaddress \
                 python-dateutil \
                 inflection && \
    cd /usr/local/src && \
    wget https://raw.githubusercontent.com/migrave/migrave_software_setup/master/zyre_install.bash && \
    bash zyre_install.bash