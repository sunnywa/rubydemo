Usage
```
locals {
  region            = "ap-southeast-1" # ����aws region
  availability_zone = "ap-southeast-1a" # ���� aws az
  tag_name          = "ruby-test" # ����tag keyΪname��value
  tag_environment   = "inf" # ����tag keyΪenvironment��value
  instance_type     = "t2.micro" # �����ͺ�
  key_name          = "administrator" # ssh key ������

  storage_number    = "0" # �Ƿ����Ӳ��
  storage_size      = ["100","hard_disk_space_two","hard_disk_space_three"] # ���Ӳ�̵Ĵ�С
  root_block_size   = "10" # ϵͳ�̴�С

  owners            = "xxxx" # aws ��id�˺�


  user_data = templatefile("../../templates/script/ruby.tmpl", { HOSTNAME = local.tag_name }) # ����ϵͳ�ű�
}
```