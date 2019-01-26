# Documentation Pipeline    

Based on [StrongDM Comply](https://github.com/strongdm/comply)    

A build pipeline that renders "Policy as code" to "Human friendly" artifacts.
1. Enforces change change control via github workflow
1. Enforce template style
1. Automate  branching, tagging, version control, and archiving for policy documents!

To use this:     
use the Dockerfile in the [build/app](./build/app) directory to automate rendering of final artifacts    
via github commit webhook trigger.

To render locally:    
```
docker run -v ~/${source_directory}:/source/template ${tag_of_container}
```

---    
2018 gjyoung1974@gmail.com
