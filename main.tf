module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "public_subnet" {
  source                  = "./modules/public_subnet"
  vpc_id                  = module.vpc.vpc_id
  public_subnet_cidr      = var.public_subnet_cidr
  public_az               = var.public_az
  public_subnet_name      = var.public_subnet_name
  map_public_ip_on_launch = true
}

module "private_subnet" {
  source              = "./modules/private_subnet"
  vpc_id              = module.vpc.vpc_id
  private_subnet_cidr = var.private_subnet_cidr
  private_az          = var.private_az
  private_subnet_name = var.private_subnet_name
}

module "IG" {
  source       = "./modules/IG"
  vpc_id       = module.vpc.vpc_id
  gateway_name = var.gateway_name

}

module "nat" {
  source           = "./modules/nat"
  elastic_ip       = module.nat.elastic_ip
  public_subnet_id = module.public_subnet.public_subnet_id[0]
  nat_name         = var.nat_name
}



module "publicRT" {
  source                  = "./modules/publicRT"
  vpc_id                  = module.vpc.vpc_id
  cidr_block_public_RT    = var.cidr_block_public_RT
  internet_gateway_id     = module.IG.internet_gateway_id
  public_route_table_name = var.public_route_table_name
  public_subnet_id        = module.public_subnet.public_subnet_id
  public_RT_id            = module.publicRT.public_RT_id
}

module "privateRT" {
  source                   = "./modules/privateRT"
  vpc_id                   = module.vpc.vpc_id
  cidr_block_private_RT    = var.cidr_block_private_RT
  nat_id                   = module.nat.nat_id
  private_route_table_name = var.private_route_table_name
  private_subnet_id        = module.private_subnet.private_subnet_id
  private_RT_id            = module.privateRT.private_RT_id
}

module "publicServer" {
  source           = "./modules/publicServer"
  count            = length(var.public_server_name)
  public_server_name = var.public_server_name[count.index]
  key_name         = var.ec2_key_pair
  instance_type    = var.instance_type
  public_subnet_id = module.public_subnet.public_subnet_id[count.index]
  security_group   = [for name in var.public_server_name : name == "Nginx-Bastion" ? module.securityGroup.bastion-sg : module.securityGroup.proxy_server_sg]
}

module "privateServer" {
  source              = "./modules/privateServer"
  ami_id              = module.publicServer.0.ami_id
  instance_type       = var.instance_type
  key_name            = var.ec2_key_pair
  security_group      = [module.securityGroup.nginx_sg]
  private_subnet_id   = module.private_subnet.private_subnet_id
  private_server_name = var.private_server_name
}

module "securityGroup" {
  source = "./modules/securityGroup"
  vpc_id = module.vpc.vpc_id
}

