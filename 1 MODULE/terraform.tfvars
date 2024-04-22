#RESOURCE GROUP (RG)
rg = {
  "rg1" = {
    name     = "jan_rg1"
    location = "france central"
  }
  "rg2" = {
    name     = "jan_rg2"
    location = "france central"
  }
}

 #VIRTUAL NETWORK(VNET)
vnet = {
  "vnet1" = {
    name = "jan_vnet1"


    address_space = ["10.0.0.0/16"]

  }

}


# SUBNETS

subnet = {
  "subnet1" = {
    name                 = "jan_frontend_subnet1"
   
    address_prefixes     = ["10.0.2.0/24"]

  }
  "subnet2" = {
    name                 = "jan_backend_subnet1"
   
    address_prefixes     = ["10.0.1.0/24"]

  }
  "subnet3" = {
    name                 = "AzureBastionSubnet"
   
    address_prefixes     = ["10.0.3.0/24"]
    }
    
 

 "subnet" = {
    name                 = "jan_frontend_subnet2"
  
    address_prefixes     = ["10.0.4.0/24"]

  }
}



#public ip

public_ip = {
  "pbip 1" = {

    name                = "jan_frontend_ip"
   
    allocation_method   = "Static"
  }
  "pbip 2" = {

    name                = "jan_backend_ip"
    
    allocation_method   = "Static"
  }
  "pbip 3" = {

    name                = "jan_bastion_ip"
 
    allocation_method   = "Static"
    
  }
}

#NIC CARD
nic = {
  "nic1" = {
    #pipname =              "jan_frontend_ip"  
    nicname             = "jan_frontend_ip"
   
    name          =  "jan_frontend_subnet1"

  }
  "nic2" = {
    #pipname             = "jan_backend_ip"
    nicname             = "jan_backend_nic"
  
    
    name          = "jan_backend_subnet1"
  }
    "nic3" = {
  
    nicname             = "jan_frontend_nic2"

    name         = "jan_frontend_subnet2"
}
}

#virtual machine
vm = {
  "vm1" = {
    name                = "janfrontendvm"
   
    size                = "Standard_D1_v2"
    admin_username      = "deepak1234"
   

    nicname = "jan_frontend_ip"

  }
  "vm2" = {
    name                = "janbackendvm"
    
    size                = "Standard_F2"
    admin_username      = "deepak1234"
    

    nicname= "jan_backend_nic"

  }
    "vm3" = {
    name                = "janforntendvm2"
  
    size                = "Standard_D1_v2"
    admin_username      = "deepak1234"
   
    nicname= "jan_frontend_nic2"

}
server = {
  "server1" = {
    name                         = "jandatabaseservernew"

   
    administrator_login          = "deepak1234"
   
  }
}
sql = {
  "sql1" = {
    name           = "jandatabase"
  }
}

}



