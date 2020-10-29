```
bundle install
bundle exec rackup -p 3000
```

我的Demo是在AWS上ap-southeast-1 region 实现的
首先在AWS上创建一个VPC，VPC中创建对应的subnet，可以使用我我代码中的cloudfortion去创建vpc，创建成功vpc之后需要对其创建的vpc与subnet创建一个key为environment的tag，值按照自己的环境进行区分例如prod/test/inf等
创建成功之后在VPC中创建一台centos的EC2服务器，部署jenkins、terraform、python3、awscli，并拿到对应的iam权限access key（测试给与administrator权限）
创建terraform目录
```
mkdir /opt/terraform/aws/ap-southeast-1
git clone 
```