resource "azurerm_resource_group" "example" {
  name     = "newprovisionerrg"
  location = "west us"
}

resource "azurerm_virtual_network" "example" {
  name                = "newprovnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "newprosubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_public_ip" "example" {
  name                = "newproip"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"


}
#data "azurerm_public_ip" "public_ip" {


 # name                = "newproip"
  #resource_group_name = "newprovisionerrg"
#}
resource "azurerm_network_interface" "example" {
  name                = "newpro-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = "/subscriptions/07d28b30-1b1e-4a0c-9651-65f570421348/resourceGroups/newprovisionerrg/providers/Microsoft.Network/publicIPAddresses/newproip"
    
  }
}
resource "azurerm_network_security_group" "example" {
  name                = "newdeepaknsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
security_rule {
    name                       = "test345"
    priority                   = 500
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
}
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}


resource "azurerm_linux_virtual_machine" "example" {
  name                            = "newpro-machine"
  resource_group_name             = azurerm_resource_group.example.name
  location                        = azurerm_resource_group.example.location
  size                            = "Standard_F2"
  admin_username                  = "deepak"
  admin_password                  = "Deepak@1123"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
   connection {
    host =self.public_ip_address
    type     = "ssh"
    user     = "deepak"
    password = "Deepak@123"
    timeout = "4m"
    
  }
  provisioner "file" {
    source = "index.html"
    destination = "/tmp/index.html"
  }
   provisioner "remote-exec" {
    inline = [ 
        "sudo apt update",
        "sudo apt install nginx -y",
        "sudo cp /tmp/index.html /var/www/html"
     ]
     
   }
   provisioner "local-exec" {
    command = "echo complete > completed.txt"
     
   }
}


 
