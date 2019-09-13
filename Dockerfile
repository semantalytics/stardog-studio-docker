FROM ubuntu

RUN apt-get update
RUN apt-get -y install libglib2.0-0 libgtk-3-0 libx11-6 libx11-xcb1 libnss3 libxss1 libasound2

WORKDIR /opt
COPY Stardog+Studio-latest.tar.gz .
RUN tar xvzf Stardog+Studio-latest.tar.gz && mv Stardog\ Studio-* stardog-studio && useradd -ms /bin/bash stardog && chown stardog.stardog -R stardog-studio

USER stardog

WORKDIR "/opt/stardog-studio"
ENTRYPOINT ["./stardog-studio"]
