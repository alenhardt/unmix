FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    libsox-fmt-all \
    sox \
    libsox-dev \
    git \
    curl \
    sudo \
    gpg \
    coreutils

WORKDIR /workspace

RUN conda install pip ffmpeg gh scikit-learn tqdm libsndfile scipy numpy -c conda-forge
RUN pip install musdb ffmpeg musdb museval asteroid-filterbanks gitpython stempeg
#RUN pip install openunmix['stempeg']
#RUN git clone https://github.com/alenhardt/unmix.git
COPY openunmix/ /workspace/unmix/openunmix/
COPY scripts/ /workspace/unmix/scripts/
COPY tests/ /workspace/unmix/tests/
COPY pdoc/ /workspace/unmix/pdoc/
ADD hubconf.py /workspace/unmix/
ADD README.md /workspace/unmix/
ADD setup.py /workspace/unmix/
ADD pyproject.toml /workspace/unmix/
ADD run_training.sh /workspace/unmix/
WORKDIR /workspace/unmix
# RUN git checkout dev
RUN pip install .

ENTRYPOINT ["./run_training.sh"]