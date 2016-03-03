FROM yowcow/perl5:5.22.1
MAINTAINER yowcow <yowcow@gmail.com>

COPY cpanfile /cpanfile

RUN cpanm --installdeps --notest --quiet . \
    && rm -rf /root/.cpanm

EXPOSE 5000

CMD perl -v
