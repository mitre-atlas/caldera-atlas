#/bin/bash

echo "starting demo"

# start caldera
if ! tmux has-session -t caldera; then
	tmux new-session -d -s caldera
fi
tmux send -t caldera "docker-compose up" ENTER
echo "started caldera"
echo "Access the caldera interface in your web browser at http://localhost:8888"

# start ml-vulhub example
if ! tmux has-session -t ml_vulhub ; then
	tmux new-session -d -s ml_vulhub
fi
tmux send -t ml_vulhub "cd ml-vulhub/envs/example-00-ml-dev/" ENTER
tmux send -t ml_vulhub "./init.sh && docker-compose up" ENTER
echo "started ml-vulhub environment"
