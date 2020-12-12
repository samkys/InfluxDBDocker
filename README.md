# InfluxGrafanaDocker
*Sam Kysar, October 2020*

# 1. Overview
+ This is a repository which contains files to build a DOCKER image.

## 1.1 Dependencies
+ Docker compose  
  - Install via running `sudo apt-get install docker-compose`

# 2. Files
+ [data_to_influx.py](./data_to_influx.py):
    - This python file is used write CAN .blf and ROS .bag files to an Influxdb
    - Depends on binary_log_decode.py.
    - Run with: `To be added from TMT_SERVICES >>>>REPO<<<<` 
+ [binary_log_decode.py](./binary_log_decode.py):
    - This python file is a dependency for the data_to_influx.py file.

+ [Dockerfile](./Dockerfile):
    - This file is the build file for the docker image.
    - Depends on all other files not listed above.

# 3. Getting started
1. Make sure you install Docker, see 1.1.
2. Open a terminal in this directory (Windows powershell as admin assumed)
3. Run: `sudo docker-compose build`  
    - This builds a docker image from the docker-compose file.  
4. To launch an instance of the image run the following.  
    - `sudo docker-compose up`
    - Maybe ignore the rest?
    - `docker run -v c:/users/<you>/Desktop/database/:/var/lib/influxdb/ -ditp 3000:3000 dbDocker`
    - `docker run` tells the container to start a container
    - `-v c:/users/<you>/Desktop/database/:/var/lib/influxdb/` tells the container to mount the /var/libinfluxdb/ directory to a local directory on the host (rename the path to where you want the database info stored...)
    - `-ditp 3000:3000` is a list of switches
        - `-d` is detached
        - `-it` is interactive
        - `-p` is port map, expose port 3000 to 3000 on host (Grafana port is 3000)
    - `dbDocker` at the end is telling docker which image to run, this is dependent on step 3.3.
5. Open a browser and you can access the Grafana dashboard at `localhost:3000` with username and pasword of admin admin.
6. Data can be loaded to the database using section 2, `data_to_influx.py`.
7. Enjoy all of the fancy info! :-)

## Questions/Contact  
  
skysar < at > prattmiller.com 