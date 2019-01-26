## StrongDM Comply application container
FROM gyoung/comply:latest
LABEL maintainer="Gordon Young <gjyoung1974@gmail.com>"
LABEL description="Use this container to render docs from markdown/RST to human friendly artifacts"

ENV LANG C.UTF-8
ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/2.4/bin:/opt/ghc/8.6.3/bin:$PATH

WORKDIR /source
ADD render.sh /source/render.sh
ADD ./template /source/template

# run a command
ENTRYPOINT ["/source/render.sh"]

