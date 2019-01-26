# Documentation Pipeline    

Based on [StrongDM Comply](https://github.com/strongdm/comply)    

A build pipeline that renders "policy-as-code" to "human friendly" artifacts: word processor docs, web files, EReader, PDF etc.    

Value addded:     
1. Enable enforcement of documentation change control via git/github workflow.
1. Enforce documentation template style consistency.
1. Include documentation TDD quality gates.
1. Automate  branching, tagging, version control, and archiving for policy documents!

To use this:     
use the Dockerfile in the [build/app](./build/app) directory to automate rendering of final artifacts    
via github commit webhook trigger.

To render locally, do something like:    

A. fork a documents templates repo to your GH Account:    
[soc2-policy-templates](https://github.com/gjyoung1974/soc2-policy-templates)     

B. make required edits to the Markdown code   

```shell
cd ~
git clone https://github.com/gjyoung1974/soc2-policy-templates.git
```

C. then  run docker     

```shell
docker run --env gh_token=${GITHUB_TOKEN} --env gh_user=${GITHUB_USER} --env gh_email=${GITHUB_EMAIL} \
    --env gh_repo="soc2-policy-templates" -v ~/soc2-policy-templates:/source gyoung/comply:latest
```

Ultimately use the Dockerfile in the 'app' directory to build a CICD pipeline build configuration.    

---    
2018 gjyoung1974@gmail.com
