FROM ubuntu:16.04

RUN apt-get update && \
     apt-get upgrade -y && \
     apt-get install -y wget curl ssh rsync bedtools

RUN mkdir /ucsc_utilities

WORKDIR /ucsc_utilities

# Fetch tools from hgdownload
RUN rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/linux.x86_64/ ./

RUN chmod +x /ucsc_utilities/*
ENV PATH /ucsc_utilities:$PATH