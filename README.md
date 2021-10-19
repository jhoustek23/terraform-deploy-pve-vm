# Terraform deploy PVE VM
Vytvori set VM v proxmoxu (debian 11 cloud)

je potreba definovat ve variables.tf
```
variable "pm_user"
```

v main.tf upravit
```
count
name
ipconfig0
```

spustit
```
# terraform init
# terraform plan -out planfile
# terraform apply "planfile"
```

resources:
https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu
