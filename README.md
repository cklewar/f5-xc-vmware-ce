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

````

## VMWare vSphere Cloud CE Multi Node Single NIC module usage example

````hcl

````