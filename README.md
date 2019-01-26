# Documentation Pipeline    

Based on [StrongDM Comply](https://github.com/strongdm/comply)    

A build pipeline that renders "Policy as code" to "Human friendly" artifacts.
1. Enforces change change control via github workflow
1. Enforce template style
1. Include documentation TDD quality gates.
1. Automate  branching, tagging, version control, and archiving for policy documents!

To use this:     
use the Dockerfile in the [build/app](./build/app) directory to automate rendering of final artifacts    
via github commit webhook trigger.

To render locally, do something like:    

```shell
mkdir ~/soc2-policy-templates
````

then  

```shell
docker run --env gh_token=${GITHUB_TOKEN} --env gh_user=${GITHUB_USER} --env gh_email=${GITHUB_EMAIL} \
    --env gh_repo="soc2-policy-templates" -v ~/soc2-policy-templates:/source gyoung/comply:latest
```

---    
2018 gjyoung1974@gmail.com
