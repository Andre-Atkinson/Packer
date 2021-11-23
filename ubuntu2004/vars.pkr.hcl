variable "vcenter_server" {
    type = string
}

variable "username" {
    type = string
}

variable "password" {
    type = string
}

variable "insecure_connection" {
    type = bool
}

variable "host" {
    type = string
}

variable "datastore" {
    type = string
}

variable "vm_name" {
    type = string
}

variable "cluster" {
    type = string
}

variable "datacenter" {
    type = string
}

variable "folder" {
    type = string
}

variable "CPUs" {
    type = string
}

variable "RAM" {
    type = string
}

variable "guest_os_type" {
    type = string
}

variable "network" {
    type = string
}

variable "iso_paths" {
    type = string
}

variable "disk_size" {
}

variable "ssh_username" {
    type = string
}

variable "ssh_password" {
    type = string
}