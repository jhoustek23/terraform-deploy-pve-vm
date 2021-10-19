resource "proxmox_vm_qemu" "pve-vm" {
  count             = 3
  name              = "test-${count.index}"
  target_node       = "pve1-prg2a"

  clone             = "debian-cloud-template"

  os_type           = "cloud-init"
  cores             = 2
  sockets           = "1"
  cpu               = "host"
  memory            = 1024
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "ide0"
  agent             = 1
  network {
    model           = "virtio"
    bridge          = "vmbr1"
    tag            = "104"
  }

  lifecycle {
    ignore_changes  = [
      network,
    ]
  }

  # Cloud Init Settings
  ipconfig0         = "ip=10.104.10.12${count.index + 1}/24,gw=10.104.10.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
