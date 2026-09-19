# https://hub.docker.com/r/hesap/
FROM hesap/aimpy:main202002270048

MAINTAINER Mesut Karakoç <mesudkarakoc@gmail.com>

# root user
USER root

# add jupyter notebooks
ADD jupyter_notebook_config.py /home/main/.jupyter/jupyter_notebook_config.py
ADD jupyter.sh /home/main/jupyter.sh
RUN chmod +x jupyter.sh

ADD dersnotlari /home/main/dersnotlari
RUN chown -R main:main /home/main/dersnotlari

# main user
USER main

# working directory
WORKDIR /home/main

# jupyter notebook and its ip to use from outside of the Docker container
EXPOSE 8888

#CMD echo '**************************************************'                          && \
#    echo 'check whether the following IP exist if not change the IP in the Dockerfile' && \
#    echo http://`hostname -i | awk '{print $1}'`:8888/?token=[COPY PASTE TOKEN HERE]   && \
#    echo '**************************************************'                          && \
#    echo                                                                               && \
#    jupyter notebook --no-browser --ip=172.17.0.2 --port=8888 --allow-root
#    jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --allow-root

