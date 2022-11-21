# unitree_common
This is a common repository that contain links on working repositories with Unitree Controller package, Navigation package and Visual-Inertial Odometry package.

# Getting started for simulator
Get raisim activation key here [Get Raisim key](https://raisim.com/sections/License.html) and copy into `workspace` directory

Clone commmon repository:
```bash
git clone --recursive git@github.com:ITMORobotics/RaiSimDocker.git
```

and build docker image (required long time):
```bash
 ./docker/build_docker.sh -r
```

After that run docker container:
```bash
./docker/run_docker.sh
```

Start building ros1 packages:
```bash
cd workspace/ws-ros1/
catkin build
```

Brew coffee, sit back and wait for the assembly to complete