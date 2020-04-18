# MatrixDeployer
This is a terraform script that will build the needed AWS infrastructure to host a docker container that will deploy the Matrix communication server for the secure chat application Riot.im.
All choices for AWS infrastruction was designed to be cheap, but secure/functional.

## Prerequisites:
* Download Terraform and install it
* Download the Matrix Server code
* Make sure you are signed up for an AWS account
* Obtain or create a new IAM Access Code
 
## Steps:
Open up the code and create a new file called: 
'''
secret-variables.auto.tfvars
'''

Then insert the following text into the file for AWS access/authentication:
'''
aws_access_key_id = "type your IAM access key id to here"
aws_secret_access_key = "type your IAM secret access key to here"
'''

Within terminal, launch or initialize the terraform application by typing:
'''
terraform init
'''

Next, you will start building the AWS architecture/application with the use of: 
'''
terraform apply
'''

To pause the server, send the request through AWS to STOP the EC2 instance. Then you can start when ready to go.

When logging into the IP address for the first time, make sure you use
'''
<EC2 IP Address>:8008
'''

## Clean Up:
When finished with the server and wanting to clean up AWS, send the command within terminal: 
'''
terraform destroy
'''

## Known Issues:
After navigating to the webpage, it may take 10 minutes for the server to boot up.

When you open the webpage for the first time, if nothing happens, the container may be frozen.
Open AWS System console and type the following -
* docker ps -a    (copy the container ID)
* docker container rm <id>
* run the two docker commands found in Scripts -> matrix_installer.sh
* wait 10 minutes for it to start