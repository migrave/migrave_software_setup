sudo apt install python3-catkin-tools \
                 python3-wstool \
                 python3-rosdep \
                 python3-rosinstall \
                 python3-rosinstall-generator

sudo rosdep init
rosdep update

# create catkin workspace
cd ~/
mkdir -p migrave_ws/src
cd ~/migrave_ws/src && catkin_init_workspace

# pull components
cd ~/migrave_ws
wstool init src
wstool merge -t src https://raw.githubusercontent.com/migrave/migrave_software_setup/main/components.rosinstall
wstool update -t src
rosdep install --from-paths src --ignore-src --rosdistro=noetic -y

# build all packages
catkin build
