# 
FROM ghcr.io/opennmt/ctranslate2:3.17.1-ubuntu20.04-cuda11.2

# 
WORKDIR /code

RUN mkdir /code/models

# 
COPY ./requirements.txt /code/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
RUN apt-get update && apt-get install git -y
RUN pip install bitsandbytes git+https://github.com/huggingface/transformers.git git+https://github.com/huggingface/peft.git git+https://github.com/huggingface/accelerate.git datasets einops
RUN pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
RUN pip install ctranslate2==3.21.0

# 
COPY ./app /code/app
COPY ./run.sh /code/run.sh
#
#ENTRYPOINT ["sh", "run.sh"]


