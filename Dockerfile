# install files extract
FROM stefanscherer/busybox-windows:latest AS install_files

# which version are we installing from
ARG INSTALL_FILE=PROGRESS_OE_11.6_WIN_32.zip
ARG PATCH_FILE=PROGRESS_OE_11.6.4_WIN_32_FINAL.zip
ARG HFS_ROOT=http://docker.for.win.localhost

LABEL org.label-schema.docker.schema-version="1.0"
LABEL org.label-schema.name="docker-oe116-setup"
LABEL org.label-schema.description="OpenEdge setup image for generating response.ini files."
LABEL org.label-schema.vendor="Nick Heap"
LABEL org.label-schema.url="https://github.com/NickHeap/docker-oe116-setup"
LABEL org.label-schema.vcs-url="github.com:NickHeap/docker-oe116-setup.git"
LABEL org.label-schema.version="0.1"

RUN mkdir -p /install/openedge/
RUN mkdir -p /patch/openedge/

# the install file has to be in the same directory as this Dockerfile
#COPY $INSTALL_FILE /install/openedge/

# pull the install file from local file server like HFS
RUN wget $HFS_ROOT/$INSTALL_FILE -P /install/openedge/
RUN unzip /install/openedge/$INSTALL_FILE -d /install/openedge/
RUN rm /install/openedge/$INSTALL_FILE

# pull the install file from local file server like HFS
RUN wget $HFS_ROOT/$PATCH_FILE -P /install/openedge/
RUN unzip /patch/openedge/$PATCH_FILE -d /patch/openedge/
RUN rm /patch/openedge/$PATCH_FILE

###############################################

# setup image for generating response.ini files
#FROM centos:7.3.1611

# get the install files
#COPY --from=install_files /install/openedge/ /install/openedge/

# we need to do the install manually
#RUN /install/oe116/proinst
