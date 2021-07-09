sudo apt install zip unzip python3-pip python3-venv ffmpeg libsm6 libxext6 -y
python3 -m venv pose_env
source pose_env/bin/activate
pip3 install -r TeamCVPR/src/pose/requirements.txt opencv-python
deactivate
