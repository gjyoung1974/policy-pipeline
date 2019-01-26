## StrongDM Comply application container
FROM gjyoung1974/complyapp:latest
LABEL maintainer="Gordon Young <gjyoung1974@gmail.com>"
LABEL description="Use this container to render docs from markdown/RST to human friendly artifacts"

ENV LANG C.UTF-8
ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/2.4/bin:/opt/ghc/8.6.3/bin:$PATH

ENV gh_user ''
ENV gh_repo ''
ENV gh_token ''
ENV gh_email ''

WORKDIR /source
ADD render.sh /usr/local/bin/render.sh

# run a command
ENTRYPOINT ["/usr/local/bin/render.sh"]
