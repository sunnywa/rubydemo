resource "aws_instance" "this" {
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  key_name          = var.key_name
  user_data_base64  = var.user_data_base64
  tags = {
    Name    = var.tag_name
    environment = var.tag_environment
  }
  volume_tags = {
    Name    = var.tag_name
    environment = var.tag_environment
  }
  root_block_device {
    volume_size = var.root_block_size
  }
}

resource "aws_ebs_volume" "this_ebs" {
  count = var.storage_number

  availability_zone = var.availability_zone
  size              = var.storage_size[count.index]
  tags = {
    Name = "${var.tag_name}-disk-${count.index}"
    environment = var.tag_environment
  }
}

resource "aws_volume_attachment" "this_attachment_ebs" {
  count = var.storage_number

  device_name = var.storage_dev[count.index]
  instance_id = aws_instance.this.id
  volume_id   = aws_ebs_volume.this_ebs[count.index].id
}
