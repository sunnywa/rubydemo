Usage
```
locals {
  region            = "ap-southeast-1" # 输入aws region
  availability_zone = "ap-southeast-1a" # 输入 aws az
  tag_name          = "ruby-test" # 输入tag key为name的value
  tag_environment   = "inf" # 输入tag key为environment的value
  instance_type     = "t2.micro" # 机器型号
  key_name          = "administrator" # ssh key 的名字

  storage_number    = "0" # 是否添加硬盘
  storage_size      = ["100","hard_disk_space_two","hard_disk_space_three"] # 添加硬盘的大小
  root_block_size   = "10" # 系统盘大小

  owners            = "xxxx" # aws 的id账号


  user_data = templatefile("../../templates/script/ruby.tmpl", { HOSTNAME = local.tag_name }) # 调用系统脚本
}
```