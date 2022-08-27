FROM python:3.8-slim

ARG USER=boto

RUN useradd -ms /bin/bash ${USER}
USER ${USER}

WORKDIR /home/${USER}

COPY . .
RUN mkdir /home/${USER}/.aws &&
    mv credentials /home/${USER}/.aws &&
    pip install -r requirments.txt

CMD {"python", "run.py"}