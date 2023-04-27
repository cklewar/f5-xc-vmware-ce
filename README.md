# VMWARE VSPHERE CLOUD CE

Terraform to create F5XC VMWare vSphere cloud CE

## Usage

- Clone this repo with `git clone --recurse-submodules https://github.com/cklewar/f5-xc-vmware-ce`
- Enter repository directory with `cd vmware vsphere cloud ce`
- Obtain F5XC API certificate file from Console and save it to `cert` directory
- Pick and choose from below examples and add mandatory input data and copy data into file `main.py.example`.
- Rename file __main.tf.example__ to __main.tf__ with `rename main.py.example main.py`
- Change backend settings in `versions.tf` file to fit your environment needs
- Initialize with `terraform init`
- Apply with `terraform apply -auto-approve` or destroy with `terraform destroy -auto-approve`

## VMWare vSphere Cloud CE Single Node Single NIC module usage example

````hcl
variable "project_prefix" {
  type        = string
  description = "prefix string put in front of string"
  default     = "f5xc"
}

variable "project_suffix" {
  type        = string
  description = "prefix string put at the end of string"
  default     = "01"
}

variable "f5xc_api_p12_file" {
  type = string
}

variable "f5xc_api_url" {
  type = string
}

variable "f5xc_api_token" {
  type = string
}

variable "f5xc_tenant" {
  type = string
}

variable "f5xc_namespace" {
  type    = string
  default = "system"
}

variable "ssh_public_key_file" {
  type = string
}

module "vsphere_single_node_single_nic" {
  source                  = "./modules/f5xc/ce/vsphere"
  is_sensitive            = false
  f5xc_tenant             = var.f5xc_tenant
  f5xc_api_url            = var.f5xc_api_url
  f5xc_namespace          = var.f5xc_namespace
  f5xc_api_token          = var.f5xc_api_token
  f5xc_cluster_name       = format("%s-%s-%s", var.project_prefix, "vsphere-ce", var.project_suffix)
  f5xc_site_latitude      = -73.935242
  f5xc_site_longitude     = 40.730610
  f5xc_ce_gateway_type    = "ingress_gateway"
  f5xc_vsphere_site_nodes = {
    master-0 : {
      host                       = "192.168.40.100",
      dhcp                       = false,
      datastore                  = "datastore2",
      adapter_type               = "vmxnet3",
      outside_network_ip_address = "192.168.40.111/24",
    }
  }
  vsphere_cluster              = var.vsphere_cluster
  vsphere_datacenter           = var.vsphere_datacenter
  vsphere_instance_dns_servers = {
    primary   = "8.8.8.8"
    secondary = "8.8.8.4"
  }
  vsphere_instance_admin_password                    = var.vsphere_instance_admin_password
  vsphere_instance_inside_network_name               = "VM Network"
  vsphere_instance_outside_network_name              = "openwrt_inside"
  vsphere_instance_outside_interface_default_route   = "0.0.0.0/0"
  vsphere_instance_outside_interface_default_gateway = "192.168.40.1"
  providers                                          = {
    vsphere  = vsphere.default
    volterra = volterra.default
  }
}

output "vsphere_single_node_single_nic" {
  value = module.vsphere_single_node_single_nic
}
````

## VMWare vSphere Cloud CE Multi Node Single NIC module usage example

````hcl
variable "project_prefix" {
  type        = string
  description = "prefix string put in front of string"
  default     = "f5xc"
}

variable "project_suffix" {
  type        = string
  description = "prefix string put at the end of string"
  default     = "01"
}

variable "f5xc_api_p12_file" {
  type = string
}

variable "f5xc_api_url" {
  type = string
}

variable "f5xc_api_token" {
  type = string
}

variable "f5xc_tenant" {
  type = string
}

variable "f5xc_namespace" {
  type    = string
  default = "system"
}

variable "ssh_public_key_file" {
  type = string
}

module "vsphere_single_node_single_nic" {
  source                  = "./modules/f5xc/ce/vsphere"
  is_sensitive            = false
  f5xc_tenant             = var.f5xc_tenant
  f5xc_api_url            = var.f5xc_api_url
  f5xc_namespace          = var.f5xc_namespace
  f5xc_api_token          = var.f5xc_api_token
  f5xc_cluster_name       = format("%s-%s-%s", var.project_prefix, "vsphere-ce", var.project_suffix)
  f5xc_site_latitude      = -73.935242
  f5xc_site_longitude     = 40.730610
  f5xc_ce_gateway_type    = "ingress_gateway"
  f5xc_vsphere_site_nodes = {
    master-0 : {
      host                       = "192.168.40.100",
      dhcp                       = false,
      datastore                  = "datastore2",
      adapter_type               = "vmxnet3",
      outside_network_ip_address = "192.168.40.111/24",
    }
    master-1 : {
      host                       = "192.168.40.100",
      dhcp                       = false,
      datastore                  = "datastore2",
      adapter_type               = "vmxnet3",
      outside_network_ip_address = "192.168.40.112/24",
    }
    master-2 : {
      host                       = "192.168.40.100",
      dhcp                       = false,
      datastore                  = "datastore2",
      adapter_type               = "vmxnet3",
      outside_network_ip_address = "192.168.40.113/24",
    }
  }
  vsphere_cluster              = var.vsphere_cluster
  vsphere_datacenter           = var.vsphere_datacenter
  vsphere_instance_dns_servers = {
    primary   = "8.8.8.8"
    secondary = "8.8.8.4"
  }
  vsphere_instance_admin_password                    = var.vsphere_instance_admin_password
  vsphere_instance_inside_network_name               = "VM Network"
  vsphere_instance_outside_network_name              = "openwrt_inside"
  vsphere_instance_outside_interface_default_route   = "0.0.0.0/0"
  vsphere_instance_outside_interface_default_gateway = "192.168.40.1"
  providers                                          = {
    vsphere  = vsphere.default
    volterra = volterra.default
  }
}

output "vsphere_single_node_single_nic" {
  value = module.vsphere_single_node_single_nic
}
````