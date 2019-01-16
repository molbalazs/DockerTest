# DockerTest
Ubuntu 18.04, Apache Maven 3.3.9, OpenJDK 8, git - proof of concept

docker build -t="maven" https://github.com/molbalazs/DockerTest.git

# Run for all platforms
docker run -tiv ~/SHARED:/VMSHARED maven

# Run for one platform
docker run -tiv ~/SHARED:/VMSHARED maven amazonfire