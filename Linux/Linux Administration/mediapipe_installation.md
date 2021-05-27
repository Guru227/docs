# Install Mediapipe
(27-May 2021)

The pre-requisites for mediapipe are:
1. Python 3.7
2. OpenCV 3.x
3. Bazelisk

## Compile Python 3.7.x from source

1. Install dependencies

`sudo apt-get install libssl-dev openssl make gcc`

Then, enable the source packages by adding the location of the source packages 
in the `/etc/apt/sources.list`.Just uncomment the line similar to:

`deb-src http://archive.ubuntu.com/ubuntu/ bionic main`

Then, update the packages index:
`sudo apt-get update`

`sudo apt-get build-dep python3.8` (try reducing or increasing the minor version 
until you find a package that is available - this step is to avoid the _ctypes 
error. 3.8 worked)

2. Choose Python version from https://www.python.org/ftp/python/. 

`cd /opt` <br />
`wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz`

3. Extract the archive

`tar xzvf Python-3.7.9.tgz`

4. Move into the directory and compile the new version

`cd Python-3.7.9`

`./configure`

`make`

`make install`

5. Create a symlink so that the binary can be used from anywhere

`sudo ln -fs /opt/Python-3.7.9/Python /usr/bin/python3.7`

6. Verify the python installation

`python3.7 --version`

7. Make python 3.7 the default version
I wasn't required to do this step. Executing `python3` ran python3.7. But if it's required, try following the steps from the sources

8. Install numpy

`pip3 install numpy`


## Install nodejs and npm (For installing Bazelisk)

1. Install

`sudo apt update`

`sudo apt install nodejs npm`

1. Verify

`nodejs --version`

`npm --version`




## Installing Bazel using Bazelisk

`npm install -g @bazel/bazelisk`




## Installing Mediapipe

1. Checkout Mediapipe Repository

`cd /opt`

`git clone https://github.com/google/mediapipe.git`

Then, change into the Mediapipe root directory

`cd mediapipe`

1. Install OpenCV and FFmpeg

This step works for Ubuntu 20.04.

`sudo apt-get install libopencv-core-dev libopencv-highgui-dev libopencv-calib3d-dev libopencv-features2d-dev libopencv-imgproc-dev libopencv-video-dev` 

1. (Did not configure it with GPU acceleration)

1. Run the Hello World! in C++ example

`export GLOG_logtostderr=1`

`bazel run --define MEDIAPIPE_DISABLE_GPU=1 mediapipe/examples/desktop/hello_world:hello_world`

In case you run into problems during execution, it could be because of the degree 
of parallelization or memory constraints, which can be addressed using a few flags

`bazel run --define MEDIAPIPE_DISABLE_GPU=1  --jobs 3 --local_ram_resources=1024 mediapipe/examples/desktop/hello_world:hello_world`

The output should be a successful build and "Hello World" being printed 10 times.
The second successful compilation onwards you don't see "Hello World". Just a 
*built successfully* message.

## Set /opt permissions




## Sources

1. (Compiling Python from Source) https://www.digitalocean.com/community/questions/how-to-install-a-specific-python-version-on-ubuntu

1. (Avoiding ctypes error) https://cpython-devguide.readthedocs.io/setup/#build-dependencies redirected from this bug: https://bugs.python.org/issue30090

1. (Make Python3.7 the default version) https://therafman.wordpress.com/2018/12/13/upgrade-to-python-3-7-and-make-it-the-default-version-in-any-linux-ubuntu-based-distributions/

1. (Installing nodejs and npm) https://linuxize.com/post/how-to-install-node-js-on-ubuntu-20-04/

1. (Install Bazel using Bazelisk) https://docs.bazel.build/versions/master/install-bazelisk.html

1. (Installing Mediapipe) https://google.github.io/mediapipe/getting_started/install.html

1. (To try: install python3.7 using a ppa repository) https://askubuntu.com/questions/682869/how-do-i-install-a-different-python-version-using-apt-get