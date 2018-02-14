FROM ubuntu

RUN apt-get update
RUN apt-get install -y git python python-pip zlib1g-dev
RUN pip install pyyaml

WORKDIR /opt
ADD tcga-vcf-reheader.py /opt/tcga-vcf-reheader.py
