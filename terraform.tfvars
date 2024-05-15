# ========VPC=============

vpc_cidr = "192.168.0.0/24"
vpc_name = "Nginx-VPC"

# =========Public-Subnet============

# List of public subnet CIDR blocks
public_subnet_cidr = ["192.168.0.0/26", "192.168.0.64/26"]

# List of availability zones for public subnets
public_az = ["ap-south-1a", "ap-south-1b"]

# List of public subnet names
public_subnet_name = ["Ninja-Public-Subnet-1", "Ninja-Public-Subnet-2"]

# Whether to map public IP on launch (true or false)
map_public_ip_on_launch = false

# ==============Private-Subnet==============

private_subnet_cidr = ["192.168.0.128/26", "192.168.0.192/26"]

private_az = ["ap-south-1a", "ap-south-1b"]

private_subnet_name = ["Ninja-Private-Subnet-01", "Ninja-Private-Subnet-02"]

# ===============Internet Gateway====================

gateway_name = "nginx-igw"

nat_name = "nginx-nat"

cidr_block_public_RT    = "0.0.0.0/0"
public_route_table_name = "nginx-public_RT"

cidr_block_private_RT    = "0.0.0.0/0"
private_route_table_name = "nginx-private_RT"

# ================Servers=====================

instance_type       = "t2.micro"
public_server_name         = ["Nginx-Bastion"]
private_server_name = ["Nginx-WebApp-1", "Nginx-WebApp-2"]

ec2_key_pair          = "awskey"

