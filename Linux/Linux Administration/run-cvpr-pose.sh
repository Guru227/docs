# run-cvpr-pose.sh
#runs cvpr pose estimation for given input file
# one argument to script - path to video file

# activate virtual environment
source venv/pose_env/bin/activate
echo -e "Virtual Environment Activated\n"

# update requirements, if any
pip3 install -r TeamCVPR/src/pose/requirements.txt
echo -e "Environment Requirements have been Updated\n"

# run the pose estimation model
# input video file -> ~/videos/<filename>.mp4
# output csv file -> ~/output/<filename>.csv
op_fname="$(basename $1 | sed 's/\(.*\)\..*/\1/').csv"
python3 ~/TeamCVPR/src/pose/mediapipe_pose.py -v $1 -o ~/csv_output/$op_fname

# deactivate virtual environment
deactivate
echo -e "Virtual Environment Deactivated\n"
