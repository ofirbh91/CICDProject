FROM alpine:3.16

ARG USER=boto

RUN useradd -ms /bin/bash ${USER}
USER ${USER}

EXPOSE 8081:8081

WORKDIR /home/${USER}

COPY . .
RUN mkdir /home/${USER}/.aws && \
    mv credentials /home/${USER}/.aws && \
    pip install -r requirements.txt

CMD {"python", "run.py"}
