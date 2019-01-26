#!/bin/bash
docker run --env gh_token=${GITHUB_TOKEN} --env gh_user=${GITHUB_USER} --env gh_email=${GITHUB_EMAIL} \
    --env gh_repo="soc2-policy-templates" -v ~/soc2-policy-templates:/source gyoung/comply:latest
