# Terraform_Modules

Example of how to use terraform modules you can follow the tutorial on my blog 
To use the repo, add a folder called "vars" in the provision folder.
Within vars, add a file called values.tfvars and add your subscription id (the git ignore won't push it to GitHub)

Then in your CLI (in the provision folder) input these commands:

- terraform init
- terraform plan -var-file="vars/values.tfvars"
- terraform apply -auto-approve -var-file="vars/values.tfvars" 
