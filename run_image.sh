docker run -it -p 8006:80 --gpus all -v $HOME/.iris_cache/:/code/models/  --entrypoint /bin/bash mendeza/takeoff-mistral  -c "export TAKEOFF_MOD
EL_NAME=mistralai/Mistral-7B-Instruct-v0.1 && export TAKEOFF_DEVICE=cuda && sh run.sh"
