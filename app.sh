#!/bin/sh
git clone "git@gitlab.channel4.com:bigscreen/ConnectedTVApplication.git" && cd "ConnectedTVApplication";
git checkout -q dev/misc/babel
npm install
npm run babel

if [ $1 = "all" ]
then
#Run maven script for all platforms
mvn package
else
#Run maven script for one platform
mvn package -pl $1
fi

#Create a shared folder with the timestamp of the last commit as a name
foldername=$(git log -1 --format=%cd --date=format:%F_%H:%M)
mkdir -p /VMSHARED/"$foldername"

#Copy all zip files into shared folder
find . -name \*.zip -exec cp {} /VMSHARED/"$foldername" \;