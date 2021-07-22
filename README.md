- This is complete - Github webhook action - on changes send out to jenkins
EKS - Jenkins on cluster
Jenkins - builds code on pod, and pushes up the image somewhere, how about ECR
Use a module for putting the actual k8s deployment so that it isn't in with the EKS configuration, but we will need to grab some outputs from it
You'll then run terraform with the variable which would build the image, and take in the specific version number and pull down that image for it
Update the DNS name with the ELB that is generated from the terraform build of the k8s pod for the built image
