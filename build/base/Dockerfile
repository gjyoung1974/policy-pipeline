## Dockerfile for a haskell environment
FROM debian:stretch
LABEL maintainer="Gordon Young <gjyoung1974@gmail.com>"
LABEL description="This container enables rendering policy-as-code to human friendly artifacts"

ENV LANG C.UTF-8
ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/2.4/bin:/opt/ghc/8.6.3/bin:$PATH

ENV PANDOC_VERSION "2.5"
ENV COMPLY_VERSION "v1.3.7"
ENV HASKELL_STACK_VERSION "1.9.3"

RUN apt-get update && \
    #TODO: Fix all the package authentication issues:
    # apt-get install -y --allow-unauthenticated --no-install-recommends gnupg ca-certificates dirmngr curl git && \
    apt-get install -y --allow-unauthenticated --no-install-recommends gnupg ca-certificates curl git && \
    echo 'deb http://downloads.haskell.org/debian stretch main' > /etc/apt/sources.list.d/ghc.list && \
    # apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA3CBA3FFE22B574 && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated --no-install-recommends ghc-8.6.3 cabal-install-2.4 \
        zlib1g-dev libtinfo-dev libsqlite3-dev g++ netbase xz-utils make && \
    curl -fSL https://github.com/commercialhaskell/stack/releases/download/v${HASKELL_STACK_VERSION}/stack-${HASKELL_STACK_VERSION}-linux-x86_64.tar.gz -o stack.tar.gz && \
    # curl -fSL https://github.com/commercialhaskell/stack/releases/download/v${HASKELL_STACK_VERSION}/stack-${HASKELL_STACK_VERSION}-linux-x86_64.tar.gz.asc -o stack.tar.gz.asc && \
    export GNUPGHOME="$(mktemp -d)" && \
    # gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys C5705533DA4F78D8664B5DC0575159689BEFB442 && \
    # gpg --batch --verify stack.tar.gz.asc stack.tar.gz && \
    tar -xf stack.tar.gz -C /usr/local/bin --strip-components=1 && \
    /usr/local/bin/stack config set system-ghc --global true && \
    /usr/local/bin/stack config set install-ghc --global false && \
    # rm -rf "$GNUPGHOME" /var/lib/apt/lists/* /stack.tar.gz.asc /stack.tar.gz \
    # install latex texlive packages (core document rendering libraries)
    apt-get install --allow-unauthenticated -y -o Acquire::Retries=10 --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig \
    lmodern

# install pandoc
RUN cabal update && cabal install pandoc-${PANDOC_VERSION}

# install StrongDM Comply
RUN curl -fSL https://github.com/strongdm/comply/releases/download/${COMPLY_VERSION}/comply-${COMPLY_VERSION}-linux-amd64.tgz -o comply.tar.gz && \
tar -xf comply.tar.gz -C /usr/local/bin && \
mv /usr/local/bin/comply-${COMPLY_VERSION}-linux-amd64 /usr/local/bin/comply

WORKDIR /source

# hold the container open:
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
