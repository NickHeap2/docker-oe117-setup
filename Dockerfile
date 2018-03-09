# install files extract
FROM busybox:1.28.1 AS install_files

# which version are we installing from
ARG INSTALL_FILE=PROGRESS_OE_11.7_LNX_64_EVAL.tar.gz
ARG HFS_ROOT=http://192.168.0.10

LABEL org.label-schema.docker.schema-version="1.0"
LABEL org.label-schema.name="docker-oe117-setup"
LABEL org.label-schema.description="OpenEdge setup image for generating response.ini files."
LABEL org.label-schema.vendor="Nick Heap"
LABEL org.label-schema.url="https://github.com/NickHeap/docker-oe117-setup"
LABEL org.label-schema.vcs-url="github.com:NickHeap/docker-oe117-setup.git"
LABEL org.label-schema.version="0.1"

RUN mkdir -p /install/openedge/

# the install file has to be in the same directory as this Dockerfile
#COPY $INSTALL_FILE /install/openedge/

# pull the install file from local file server like HFS
RUN wget $HFS_ROOT/$INSTALL_FILE -P /install/openedge/
RUN tar -xf /install/openedge/$INSTALL_FILE --directory /install/openedge/
RUN rm /install/openedge/$INSTALL_FILE

###############################################

# setup image for generating response.ini files
FROM centos:7.3.1611

# get the install files
COPY --from=install_files /install/openedge/ /install/openedge/

# we need to do the install manually
#RUN /install/oe117/proinst
