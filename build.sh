#!/bin/bash

[ -f FVP_Corstone_700_11.10_47.tgz ] || wget https://developer.arm.com/-/media/Arm%20Developer%20Community/Downloads/OSS/FVP/Corstone-700/Corstone-700-updated-11-10-47/FVP_Corstone_700_11.10_47.tgz

docker build -t corstone700-fvp -f Dockerfile .
