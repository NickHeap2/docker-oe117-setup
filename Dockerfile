# install files extract
FROM busybox:latest AS install_files

RUN mkdir -p /install/oe117/

# the install file has to be in the same directory as this Dockerfile
#COPY PROGRESS_OE_11.7_LNX_64_EVAL.tar.gz /install/oe117/

# pull the install file from local file server like HFS
RUN wget http://192.168.0.10/PROGRESS_OE_11.7_LNX_64_EVAL.tar.gz -P /install/oe117/
RUN tar -xf /install/oe117/PROGRESS_OE_11.7_LNX_64_EVAL.tar.gz --directory /install/oe117/
RUN rm /install/oe117/PROGRESS_OE_11.7_LNX_64_EVAL.tar.gz

###############################################

# setup image for generating response.ini files
FROM centos:7.3.1611

# get the install files
COPY --from=install_files /install/oe117/ /install/oe117/

# we need to do the install manually
#RUN /install/oe117/proinst
