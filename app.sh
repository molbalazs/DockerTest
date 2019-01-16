#!/bin/sh
git clone "git@gitlab.channel4.com:bigscreen/ConnectedTVApplication.git" && cd "ConnectedTVApplication";
if [ $1 = "all" ]
then
#Run maven script for all platforms
mvn package
else
#Run maven script for one platform
mvn package -pl $1
fi

#Copy the whole repository into the mounted folder
cp -r ../ConnectedTVApplication /VMSHARED