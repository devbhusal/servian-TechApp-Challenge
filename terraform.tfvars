database_name = "postgresDB" // database name
database_user = "postgresUSER" //database username
shared_credentials_file = "~/.aws" //Access key and Secret key file location
region  = "ap-southeast-2"  //sydney region
AZ1 = "ap-southeast-2a"  // avaibility zone
AZ2 = "ap-southeast-2b"
AZ3 = "ap-southeast-2c"
ami           = "ami-0b7dcd6e6fd797935"  // ubuntu ami
PUBLIC_KEY_PATH ="./mykey-pair.pub" // key name for ec2, make sure it is created before terrafomr apply
instance_type = "t2.micro" //type pf instance
instance_class = "db.t2.micro"