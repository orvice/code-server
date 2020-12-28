FROM codercom/code-server:3.6.0

USER root

COPY --from=golang /usr/local/go /usr/local/go
COPY install.sh .
RUN  ./install.sh

USER 1000

ENV GOROOT /usr/local/go
ENV GOPATH /home/coder/project/go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH


WORKDIR /home/coder
ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "."]
