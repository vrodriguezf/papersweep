FROM vrodriguezf/jupyterlab-cuda

##
# Add non-root user (call this with the specific UID and GIO of the host, to share permissions)
##
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER=user

RUN addgroup --gid $GROUP_ID $USER
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER

# Copy the default jupyterlab settings user settings to the new user folder
RUN cp -r /.jupyter /home/$USER/.jupyter
RUN chown -R $USER_ID:$GROUP_ID /home/$USER/.jupyter

###
# Python packages
###

# PyPi
RUN pip install --upgrade nbdev papermill wandb fastcore numpy twine

# Git

# Editable installs

##
# change default user to $USER
##
USER $USER
WORKDIR /home/$USER
