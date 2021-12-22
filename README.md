<h1> About </h1>
<p> This project is about my idea of how to deploy Golang web server in AWS IAAS using Terraform. </p>
<p> Challenge was to deploy Golang web Application using Code. I chose Terraform beacause of its simplicity. </p>
<p> The main GO project is in  https://github.com/servian/TechChallengeApp.git </p>

<-------------------------------------------------------------------------------------------------------------->

<h2> AWS Architecture </h2>
<p>  Golang project is deployed in EC2 and corresponding postgres is deployed in RDS with postgres 12.5 engine with db.t2.micro instance size. <p>
<p> Every resources created is within Free-Tier Limit. </p>

<p> EC2 USERDATA will be used to build and start webserver. </p> 

<h3> Security: </h3>
<p> EC2 will be launched in public subnet and RDS will be launched in private subnet </p>
<p> Only EC2 with defined security group can access RDS and RDS wont have internet access </p>


<----------------------------------------------------------------------------------------------------------------------->

<h2> Prerequisite </h2>
<p> Before launching Terraform template, aws cli should be installed and configured with proper access key and secret key </p>
<p> Terraform should be installed in your local machine </p>

<------------------------------------------------------------------------------------------------------------------------>

<h2> STEPS: </h2>

 <p>Clone this repo using command <code>  git clone https://github.com/devbhusal/servian-TechApp-Challenge.git </code></p>
 <p> Go to project folder         <code>  cd servian-TechApp-Challenge </code></p>
 <p>Initialize terraform          <code>  terraform init</code></p>
 <p>Change database and aws setting in terraform.tfvars file </code></p>
 <p>Generate Key pair using        <code> ssh-keygen -f mykey-pair  </code></p>
 <p>View Plan using                <code> terraform plan -var-file="user.tfvars"  </code></p>
 <p>Apply the plan using           <code> terraform apply -var-file="user.tfvars" </code></p>
 
 <p>Wait for atleast 3 mins after provision finished, before typing displayed public IP address in your browser.</p>
 <h3> everything is Automatic. This will provision all needed  aws resources and also build and start webserver using cloud init </h3>

 <p>Destroy the resources          <code> terraform destroy -var-file="user.tfvars" </code></p>



