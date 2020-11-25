FROM vrodriguezf/jupyterlab-cuda

# Add non-root user (call this with the specific UID and GIO of the host, to share permissions)
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER=user

RUN addgroup --gid $GROUP_ID $USER
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER

###
# Python packages
###

# PyPi
RUN pip install --upgrade nbdev papermill wandb

# Environmental variables for wandb
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# change default user to $USER
USER $USER
WORKDIR /home/$USER

