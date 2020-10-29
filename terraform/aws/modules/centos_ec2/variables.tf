variable "availability_zone" {
  type        = string
  description = "请输入创建的可用区"
}
variable "instance_type" {
  type        = string
  default     = "t3.nano"
  description = "请输入创建的实例类型"
}

variable "tag_name" {
  type        = string
  description = "请输入机器的名字"
}

variable "tag_environment" {
  type        = string
  description = "请输入计费的envirotment标签"
}

variable "storage_number" {
  type        = string
  default     = 0
  description = "请输入要创建的硬盘数量"
}

variable "key_name" {
  type        = string
  description = "清输入连接服务器使用的ssh key名字"
}

variable "ami" {
  type        = string
  description = "ID of AMI to use for the instance"
}

variable "subnet_id" {
  type        = string
  description = "The VPC Subnet ID to launch in"
}

variable "user_data_base64" {
  description = "Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
  type        = string
  default     = null
}

variable "storage_dev" {
  type    = map
  default = {
    "0"   = "/dev/sdh"
    "1"   = "/dev/sdi"
    "2"   = "/dev/sdj"
    "3"   = "/dev/sdk"
    "4"   = "/dev/sdl"
  }
}

variable "storage_size" {
  type    = list(string)
  default = ["10","10","10"]
}

variable "root_block_size" {
  type     = string
  default  = 8
  description = "请输入根硬盘默认大小"
}
