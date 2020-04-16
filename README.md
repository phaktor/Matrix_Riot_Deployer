# MatrixDeployer
This is a terraform script that will build the needed AWS infrastructure to host a docker container that will deploy the Matrix communication server for the secure chat application Riot.im.

All choices for AWS infrastruction was designed to be cheap, but secure/functional.


Prerequisites:
 - Download Terraform and install it
 - Download the Matrix Server code
 - Make sure you are signed up for an AWS account
 
 
Steps:
Open up the code and create a new file called: secret-variables.auto.tfvars.

Then insert: aws_access_key_id = "type your IAM access key id to here" and aws_secret_access_key = "type your IAM secret access key to here" into the app for AWS access/authentication.

Within terminal, launch or initialize the terraform application by typing: terraform init.

Next, you will start building the AWS architecture/application with the use of: terraform apply.

To pause the server, send the request through AWS to STOP the EC2 instance. Then you can start when ready to go.


Clean Up:
When finished with the server and wanting to clean up AWS, send the command within terminal: terraform destroy.
