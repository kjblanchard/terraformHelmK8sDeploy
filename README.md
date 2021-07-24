### Terraform Deployment to EKS kubernetes cluster with reusable deployment module
How to use
0. Run aws configure to set your login variables, or set your env variables correctly.
    https://registry.terraform.io/providers/hashicorp/aws/latest/docs
1. Run terraform init and apply in root - THIS WILL TAKE ABOUT 10 MINUTES
    You now have your Kubernetes cluster made.  This has output variables that the modules will call into
    If you want to run kubectl commands make sure you have kubectl and the aws cli installed and then run this command to grab your kubeconfig:
        aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
        ![Getting your kubeconfig](https://github.com/kjblanchard/terraformHelmk8sDeploy/raw/master/content/getkctl.gif "Logo Title Text 1")
2. Move into the deployment folder and run terraform init and apply
        ![Applying and checking pods](https://github.com/[kjblanchard]/[reponame]/blob/[branch]/image.jpg?raw=true)
3. You now have your deployment.  You can change the input values for the module if the image name changes when you update it in the build
        ![Changing the variables](https://github.com/[kjblanchard]/[reponame]/blob/[branch]/image.jpg?raw=true)

### Notes
- The In a real world scenario we would be using Jenkins to build with proper versioning and such, and potentially after building run a terraform deployment into the other folder if we wanted automatic deployments, otherwise stick with manual deployments
- I decided to use EKS instead of ECS as I wanted to get some experience using helm charts in kubernetes in terraform, I also wanted to try to deploy jenkins with a helm chart, but in the short time period for this I decided to cancel it as it was time consuming for configuration as code for the jenkins server.
- I used local state for the root module just so that we could skip a init/apply for building the remote backend.

### Task list
- This is complete - Github webhook action - on changes send out to jenkins
- This is complete - Create EKS in a root module so that it is separate from the deployments
- This is complete - A module that we can reuse for deployoments
- This is complete - A implementation of the module for the deployment
- This is complete - Variable to automatically set a r53 record of mine so that it updates the dns entry

- Cancelled - Building images in Jenkins in kubernetes - Too time consuming for this project to setup infra-as-code to setup the pipeline dynamically, so using github action instead to build things with less cool factor