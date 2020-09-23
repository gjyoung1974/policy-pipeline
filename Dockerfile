FROM strongdm/pandoc:latest

LABEL maintainer="Gordon Young <gjyoung1974@gmail.com>"
LABEL description="This container enables rendering policy-as-code to human friendly artifacts"

RUN apt-get update -y \
  && apt-get install -y curl

ENV COMPLY_VERSION "v1.5.1"

ENV LANG C.UTF-8
ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/2.4/bin:/opt/ghc/8.6.3/bin:$PATH

ENV gh_user ''
ENV gh_repo ''
ENV gh_token ''
ENV gh_email ''

# EXPOSE 4000/tcp

# install comply binary
RUN curl -J -L -o /tmp/comply.tgz https://github.com/strongdm/comply/releases/download/v1.5.1/comply-v1.5.1-linux-amd64.tgz \
  && tar -xzf /tmp/comply.tgz \
  && mv ./comply-v1.5.1-linux-amd64 /usr/local/bin/comply

# Add our own render script
ADD render.sh /usr/local/bin/render.sh

WORKDIR /source

# run a command
ENTRYPOINT ["/usr/local/bin/render.sh"]
