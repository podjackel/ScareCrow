FROM golang:1.21 as build
WORKDIR /scarecrow
COPY . .

RUN go get github.com/fatih/color && \
go get github.com/yeka/zip && \
go get github.com/josephspurrier/goversioninfo && \
go get github.com/Binject/debug/pe && \
apt update && \
apt install -y openssl osslsigncode mingw-w64 && \
rm -rf /var/lib/apt/lists/*

RUN go build ScareCrow.go
RUN go install ScareCrow
RUN env GOBIN=/tmp/.lib/ go install mvdan.cc/garble@latest

#This wrapper script is used to work around the relative paths used for garble
#It will run scarecrow from /tmp then copy the program output to /data, ignoring garble
RUN echo '#!/bin/bash \n\
cd /tmp \n\
/go/bin/ScareCrow $@\n\
find . -type f ! -name garble -exec cp -t /data {} +' >> /scarecrow/scarecrow-wrapper.sh

RUN chmod 777 /scarecrow/scarecrow-wrapper.sh

ENTRYPOINT [ "/scarecrow/scarecrow-wrapper.sh" ]
