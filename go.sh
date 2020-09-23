#!/bin/bash

GH_USER='gjyoung1974'
GH_REPO='soc2-policy-templates'
GH_TOKEN='93c325b3643b6d55f192a769a45f57550c809fd3'
GH_EMAIL='gjyoung1974@gmail.com'

export GH_USER
export GH_REPO
export GH_TOKEN
export GH_EMAIL

docker run --env gh_token=${GH_TOKEN} --env gh_user=${GH_USER} --env gh_email=${GH_EMAIL} \
    --env gh_repo="soc2-policy-templates" -v ~/${GH_REPO}:/source gjyoung1974/policy:latest
