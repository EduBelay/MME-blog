
variable "cpus" {
  type    = string
  default = "2"
}

variable "headless" {
  type    = string
  default = "false"
}

variable "iso_checksum" {
  type    = string
  default = "5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
}

variable "iso_url" {
  type    = string
  default = "iso/ubuntu-22.04.2-live-server-amd64.iso"
}

variable "ram" {
  type    = string
  default = "1024"
}

variable "version" {
  type    = string
  default = "0"
}

variable "virtualbox_disk_size" {
  type    = string
  default = "12288"
}

source "virtualbox-iso" "autogenerated_1" {
  boot_command           = ["<enter><enter><f6><esc><wait> ", "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/", "<enter>"]
  boot_wait              = "5s"
  disk_size              = "${var.virtualbox_disk_size}"
  format                 = "ova"
  guest_additions_mode   = "upload"
  guest_additions_path   = "VBoxGuestAdditions_{{ .Version }}.iso"
  guest_os_type          = "Ubuntu_64"
  headless               = "${var.headless}"
  iso_checksum           = "${var.iso_checksum}"
  iso_url                = "${var.iso_url}"
  shutdown_command       = "echo 'vagrant'|sudo -S shutdown -P now"
  ssh_handshake_attempts = "50"
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "10000s"
  ssh_username           = "vagrant"
  vboxmanage             = [["modifyvm", "{{ .Name }}", "--memory", "${var.ram}"], ["modifyvm", "{{ .Name }}", "--vram", "36"], ["modifyvm", "{{ .Name }}", "--cpus", "${var.cpus}"]]
  vm_name                = "ubuntu2204"
}

build {
  sources = ["source.virtualbox-iso.autogenerated_1"]

  provisioner "shell" {
    environment_vars  = ["HOME_DIR=/home/vagrant"]
    execute_command   = "echo 'vagrant' | {{ .Vars }} sudo -S -E sh -eux '{{ .Path }}'"
    expect_disconnect = true
    scripts           = ["scripts/update.sh", "scripts/sudoers.sh", "scripts/virtualbox.sh", "scripts/vagrant.sh", "scripts/cleanup.sh"]
  }

  post-processor "vagrant" {
    compression_level = "8"
    output            = "output/ubuntu-20.04-{{ .Provider }}.box"
  }
}
