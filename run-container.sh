#!/bin/bash -e

# Function to remove all running containers
remove_running_containers() {
  docker ps -q | xargs -r docker stop
  docker ps -aq | xargs -r docker rm
}

# Function to run a container with the specified version
run_container() {
  local version=$1
  local container_name="api-${version}"
  local image_name="api:${version}"

  remove_running_containers

  docker run -d --name "$container_name" -p 4000:4000 "$image_name"
  echo "Running container ${container_name} using image ${image_name} on port 4000."
}

# Main script execution
if [ "$1" == "v1" ]; then
  run_container "v1"
elif [ "$1" == "v2" ]; then
  run_container "v2"
else
  echo "Usage: ./run-container.sh [v1|v2]"
  echo "Provide 'v1' to run the v1 container or 'v2' to run the v2 container."
fi
