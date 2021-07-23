- This is complete - Github webhook action - on changes send out to jenkins
- This is complete - Create EKS in a root module so that it is separate from the deployments
- This is complete - A module that we can reuse for deployoments
- This is complete - A implementation of the module for the deployment
- This is complete - Variable to automatically set a r53 record of mine so that it updates the dns entry

- Cancelled - Building images in Jenkins in kubernetes - Too time consuming for this project to setup infra-as-code to setup the pipeline dynamically, so using github action instead to build less-cool
Jenkins - builds code on pod, and pushes up the image somewhere, how about ECR

How to use
Run terraform init in remote state to build the remote state for them so that your configuration is stored in the remote state
Run terraform init and apply in root
You now have your Kubernetes cluster made.  This has output variables that the modules will call into
If you want to run kubectl commands make sure you have kubectl and the aws cli installed and then run this command to grab your kubeconfig:
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
Move into the deployment folder
Run terraform init
Run terraform apply
You now have your deployment.  You can change the input values for the module if the image name changes when you update it in the build

