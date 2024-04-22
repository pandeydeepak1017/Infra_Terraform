module "jan_rg1" {
  source = "../RG"
  rg     = var.rg

}
module "jan_vnet1" {
  source     = "../VNET"
  vnet       = var.vnet
  depends_on = [module.jan_rg1]

}
module "subnet" {
  source = "../SUBNET"
  subnet = var.subnet
  depends_on = [ module.jan_rg1,module.jan_vnet1 ]
}
module "public_ip" {
  
  source = "../PUBLIC IP"
  public_ip = var.public_ip
  depends_on = [ module.jan_rg1,module.subnet ]

}
module "nic"{
    source = "../NIC"
    nic = var.nic
    
    depends_on = [ module.jan_rg1,module.jan_vnet1,module.subnet,module.public_ip ]
}
module "virtualmachine" {
  source = "../VIRTUAL MACHINE"
  vm =var.vm
  nic =var.nic
  depends_on = [module.jan_rg1,module.jan_vnet1,module.subnet,module.public_ip ,module.nic]
}


module "server" {
  source = "../DATABASE SERVER"
  server = var.server
  depends_on = [ module.jan_rg1 ]
}
module "database" {
  source = "../SQLDB"
  sql = var.sql
  depends_on = [  module.jan_rg1 ,module.server]
  
}

module "deepakbst" {
  
source = "../BASTION"
subnet = var.subnet

depends_on = [ module.jan_rg1,module.jan_vnet1,module.public_ip]
}
