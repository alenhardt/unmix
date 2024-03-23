FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    libsox-fmt-all \
    sox \
    libsox-dev \
    git \
    curl \
    sudo \
    gpg

WORKDIR /workspace/open-unmix-pytorch

RUN conda install pip ffmpeg gh scikit-learn tqdm libsndfile scipy numpy -c conda-forge
RUN pip install musdb ffmpeg musdb museval asteroid-filterbanks gitpython stempeg
RUN pip install openunmix['stempeg'] 
RUN git clone https://github.com/sigsep/open-unmix-pytorch.git

ENTRYPOINT ["run_trainings.sh"]