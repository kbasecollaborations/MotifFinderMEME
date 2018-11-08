FROM kbase/kbase:sdkbase2.latest
MAINTAINER KBase Developer
# -----------------------------------------
# In this section, you can install any system dependencies required
# to run your App.  For instance, you could place an apt-get update or
# install line here, a git checkout to download code, or run any other
# installation scripts.

# RUN apt-get update

# Here we install a python coverage tool and an
# https library that is out of date in the base image.

RUN pip install coverage

# update security libraries in the base image
#RUN pip install cffi --upgrade \
#    && pip install pyopenssl --upgrade \
#    && pip install ndg-httpsclient --upgrade \
#    && pip install pyasn1 --upgrade \
#    && pip install requests --upgrade \
#    && pip install 'requests[security]' --upgrade

# -----------------------------------------

RUN mkdir -p /kb/deps
COPY ./deps /kb/deps
RUN echo Making dependency

RUN \
  sh /kb/deps/kb_psl/install-pyseqlogo.sh && \
  #sh /kb/deps/kb_gibbs/install-gibbs.sh && \
  #sh /kb/deps/kb_homer/install-homer.sh && \
  sh /kb/deps/kb_meme/install-meme.sh



#RUN apt-get update && apt-get -y install python3-pip && pip3 install numpy && pip3 install scipy && pip3 install matplotlib && pip3 install pandas && pip3 install pyBigWig
#RUN git clone https://github.com/saketkc/pyseqlogo && cd pyseqlogo && python3 setup.py install && cd ..


COPY ./ /kb/module
RUN mkdir -p /kb/module/work
RUN chmod -R a+rw /kb/module

WORKDIR /kb/module






RUN make all

ENTRYPOINT [ "./scripts/entrypoint.sh" ]

CMD [ ]
