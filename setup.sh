#####################
# (1) Util
#####################
#git
sudo apt-get install git
git config --global user.email "michael.j.park@gatech.edu"
git config --global user.name "Michael Park"
sudo apt-get install gitk
#sublime, subl to run
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
sudo apt-get install sublime-text
#pip
sudo apt-get -y install python-pip
#synaptic
sudo apt-get install synaptic
#htop
sudo apt-get install htop

#####################
# (2) ROS
#####################
# ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
sudo apt-get update
sudo apt-get install ros-indigo-desktop-full
sudo rosdep init
rosdep update
#If you have more than one ROS distribution installed, ~/.bashrc must only source the setup.bash for the version you are currently using.
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install python-rosinstall

# catkin ws
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin_make
source ~/.bashrc

sudo apt-get install ros-indigo-urdfdom-py ros-indigo-ar-track-alvar ros-indigo-pr2-msgs ros-indigo-pr2-controllers-msgs ros-indigo-pr2-kinematics ros-indigo-sound-play ros-indigo-manipulation-msgs
source ~/.bashrc 

#####################
# (3) Machine Learning
#####################
## machine learning
sudo apt-get install python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
sudo apt-get install libblas-dev liblapack-dev libatlas-base-dev gfortran

# scikit learn
sudo apt-get install build-essential python-dev python-setuptools \
                     libatlas-dev libatlas3gf-base
sudo apt-get install python-numpy python-scipy 
source ~/.bashrc 

sudo update-alternatives --set libblas.so.3 /usr/lib/atlas-base/atlas/libblas.so.3
sudo update-alternatives --set liblapack.so.3 /usr/lib/atlas-base/atlas/liblapack.so.3

sudo -H pip install numpy --upgrade
sudo -H pip install scipy --upgrade

# for amazon cloud?
#sudo -H pip install --user --install-option="--prefix=" -U scikit-learn
sudo -H pip install scikit-learn

#PyMVPA??
sudo apt-get install swig

#PyMVPA
mkdir ~/git
cd ~/git 
git clone https://github.com/PyMVPA/PyMVPA.git
cd PyMVPA
python setup.py build_ext
sudo python setup.py install

source ~/.bashrc 

#cssvm (github code has path bug. Please copy my local one.)
sudo apt-get install python-libsvm
#cd ~/git 
#git clone https://github.com/airanmehr/cssvm.git
#cd cssvm
#./make
#cd python
#./make

# for star cluster
sudo apt-get update
sudo apt-get install libffi-dev g++ libssl-dev
sudo easy_install starcluster

#####################
# (4) ROS GIT INSTALL
#####################
sudo apt-get install python-openopt python-pyaudio
sudo pip install enum34
sudo add-apt-repository ppa:ubuntu-toolchain-r/rust
sudo apt-get update
sudo apt-get install llvm-4.0 llvm-4.0-dev clang-4.0
sudo LLVM_CONFIG=/usr/bin/llvm-config-4.0 pip install llvmlite 
sudo pip install librosa

## git (After adding key)
#cd ~/git
cd ~/catkin_ws/src/
git clone https://github.gatech.edu/hrl/hrl-haptic-manip-dev.git
git clone https://github.com/gt-ros-pkg/hrl-assistive.git
git clone https://github.com/gt-ros-pkg/hrl-lib.git
git clone https://github.com/gt-ros-pkg/hrl-kdl.git
git clone https://github.com/gt-ros-pkg/hrl-sensor-utils.git
git clone https://github.com/gt-ros-pkg/hrl_autobed_dev.git
git clone https://github.com/gt-ros-pkg/hrl.git
git clone https://github.com/gt-ros-pkg/hrl-pr2-behaviors.git

cd ~/catkin_ws/src/hrl-haptic-manip-dev/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-lib/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-sensor-utils/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-assistive/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl/
git checkout indigo-devel
cd ~/catkin_ws/src/hrl-kdl/
git checkout dpark_test
cd ~/catkin_ws/src/hrl-pr2-behaviors/
git checkout indigo-devel

# compile
cd ~/catkin_ws/
catkin_init_workspace
catkin_make_isolated --only-pkg-with-deps hrl_srvs --merge
catkin_make_isolated --only-pkg-with-deps hrl_kdl --merge
catkin_make_isolated --only-pkg-with-deps hrl_haptic_mpc --merge
catkin_make_isolated --only-pkg-with-deps sandbox_dpark_darpa_m3 --merge
catkin_make_isolated --only-pkg-with-deps hrl_anomaly_detection --merge
catkin_make_isolated --only-pkg-with-deps equilibrium_point_control --merge
catkin_make_isolated --only-pkg-with-deps hrl_realsense_camera --merge

