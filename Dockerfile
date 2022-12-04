FROM nvcr.io/nvidia/pytorch:22.02-py3

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl git build-essential libsndfile1
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install --no-install-recommends -y ffmpeg

ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
RUN pip install torch==1.11.0 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113
RUN pip install --ignore-installed --upgrade --no-cache-dir tensorflow
RUN pip install audiomentations pydub 
RUN pip install --ignore-installed neutone_sdk

WORKDIR /workspace
