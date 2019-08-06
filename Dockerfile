FROM kbase/sdkbase2:python
MAINTAINER KBase Developer
# -----------------------------------------
# In this section, you can install any system dependencies required
# to run your App.  For instance, you could place an apt-get update or
# install line here, a git checkout to download code, or run any other
# installation scripts.

RUN apt-get update

RUN apt-get install -y zlib1g-dev && \
    apt-get install -y curl && \
    apt-get install -y gcc && \
    apt-get install -y python3

RUN pip install --upgrade pip

RUN pip install -q coverage && \
    pip install -q cython

RUN mkdir -p /kb/deps
COPY ./deps /kb/deps
RUN echo Making dependency
COPY ./data /kb/data

RUN \
  sh /kb/deps/kb_psl/install-pyseqlogo.sh && \
  sh /kb/deps/kb_meme/install-meme.sh

ENV PATH=$PATH:/kb/deployment/bin/meme/libexec/meme-5.0.1
ENV PATH=$PATH:/kb/deployment/bin/meme/bin

COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R a+rw /kb/module

WORKDIR /kb/module

RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
