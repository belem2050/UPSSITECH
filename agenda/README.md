# Agenda
Agenda creation by using cpp.
# Disclainer
## Not a proper project but a training subject

## Docking Evaluation

the purpose of this test is to evaluate how accurate the docking process.

## Environment setup
PLace 4 fiducials at the corners of the holed trolley and one at the middle top of the robot.
Make sure to get the IDs fo these fiducials.

## Execution
To run the test, after starting the docker.
at the same time, the aruco node, the camera node by using only one camera and then run the test.
Some dedicated branches have been created.
In details, form the workpace `cmr_ros_ws/`

### Runnign setup
  1. To run the the aruco node form the branch `docking_eval`
     ```bash
         cd src/autonomy/perception/fiducials && git switch docking_eval && cd ~/workspace/cmr_ros_ws/
  2. Second Terminal to run the camera node
     ```bash
       cd src/generic/serena_bringup/ && git switch docking_eval && cd ~/workspace/cmr_ros_ws/ 
  3. Third terminal, build all the necessary packages
      ```bash
       colcon build --packages-select aruco serena_bringup serena_end_to_end_tests 
### Running
  1. In the first terminal
      ```bash
        . install/setup.bash && ros2 launch aruco aruco_localization_launch.py

  2. In the second terminal,
      ```bash
      . install/setup.bash && ros2 launch serena_bringup d435_launch.py 

  3. In the third terminal, when the robot finishes docking, run
      ```bash
      . install/setup.bash && ros2 run serena_end_to_end_tests docking_evaluation

## Data
The x, y and yaw errors are collected in a .csv file in `docking_evalution/docking_eval.csv`
