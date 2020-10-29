provider "aws" {
  region                  = local.region
}

locals {
  region            = "ap-southeast-1"
  availability_zone = "ap-southeast-1a"
  tag_name          = "test-001"
  tag_environment   = "test"
  instance_type     = "t2.micro"
  key_name          = "administrator"

  storage_number    = "0"
  storage_size      = ["100","hard_disk_space_two","hard_disk_space_three"]
  root_block_size   = "10"

  owners            = "xxxx"


  user_data = templatefile("../../templates/script/ruby.tmpl", { HOSTNAME = local.tag_name }) 
}



data "aws_ami" "centos" {
owners      = [local.owners]
most_recent = true


  filter {
      name   = "name"
      values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
      name   = "architecture"
      values = ["x86_64"]
  }

  filter {
      name   = "root-device-type"
      values = ["ebs"]
  }
}


data "aws_vpc" "default" {
  tags = {
    environment  = local.tag_environment
  }
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id

  tags = {
    environment = local.tag_environment
  }
}

module "ec2" {
  source            = "../../modules/centos_ec2"
  ami               = data.aws_ami.centos.id
  subnet_id         = tolist(data.aws_subnet_ids.all.ids)[0]

  instance_type     = local.instance_type
  availability_zone = local.availability_zone
  key_name          = local.key_name
  tag_name          = local.tag_name
  tag_environment   = local.tag_environment
  storage_number    = local.storage_number
  storage_size      = local.storage_size

  user_data_base64  = base64encode(local.user_data)
}

resource "aws_eip" "this_eip" {
  instance = module.ec2.id
  vpc      = true
}

