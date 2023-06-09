provider "volterra" {
  api_p12_file = var.f5xc_api_p12_file
  url          = var.f5xc_api_url
  timeout      = "30s"
  alias        = "default"
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_user_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
  alias                = "default"
}