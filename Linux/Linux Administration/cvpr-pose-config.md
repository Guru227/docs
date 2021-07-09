# CVPR Pose Estimation - EC2 Configuration

1. Install pip3 and python3-venv
`sudo apt install python3-pip`
`sudo apt install python3-venv`

1. Make virtual environment
`python3 -m venv pose-env`

1. Activate pose-env virtual environment
`source pose-env/bin/activate`

1. Install dependencies
`pip3 install -r TeamCVPR/src/pose/requirements.txt`

1. Install opencv
`pip3 install opencv-python`

1. Install opencv dependencies
`sudo apt install ffmpeg libsm6 libxext6 -y`

1. Upload a video, and then run a test
`python3 ~/TeamCVPR/src/pose/mediapipe_pose.py -v <video_name>.mp4 -o test.csv`

1. deactivate the environment
`deactivate`

## To make output have the same filename as input


## Sources

1. (Opencv Dependencies - LibGL error) https://stackoverflow.com/questions/55313610/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directo
