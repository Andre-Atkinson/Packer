source "vsphere-iso" "ubuntuserver" {
  vcenter_server      = var.vcenter_server
  username            = var.username
  password            = var.password
  insecure_connection = var.insecure_connection
  host                = var.host
  datastore           = var.datastore
  vm_name             = var.vm_name
  cluster             = var.cluster
  datacenter          = var.datacenter
  folder              = var.folder
  CPUs                = var.CPUs
  RAM                 = var.RAM
  guest_os_type       = var.guest_os_type
  network_adapters {
    network = var.network
    network_card = "vmxnet3"
    #mac_address = "00:50:56:00:00:01"
  }
  storage {
    disk_size = var.disk_size
    disk_thin_provisioned = true
  }
  boot_order = "disk,cdrom"
  convert_to_template = true
  iso_paths = [var.iso_paths]
  cd_files = [
    "./cloud-init/meta-data",
    "./cloud-init/user-data"]
  cd_label = "cidata"
  boot_wait = "2s"
  boot_command = [
    "<esc><esc><esc>",
    "<enter><wait>",
    "/casper/vmlinuz ",
    "initrd=/casper/initrd ",
    "autoinstall ",
    "<enter>"
  ]

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  ssh_pty = true
  ssh_timeout = "200m"
  ssh_handshake_attempts = "20"
}

build {
  sources = [
    "source.vsphere-iso.ubuntuserver"]

  provisioner "shell" {
    execute_command = "echo 'ubuntu' | {{ .Vars }} sudo -E -S sh '{{ .Path }}'"
    script = "./scripts/setup_ubuntu2004.sh"
  }
 }