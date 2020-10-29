```
bundle install
bundle exec rackup -p 3000
```

我的Demo是在AWS上ap-southeast-1 region 实现的
首先在AWS上创建一个VPC，VPC中创建对应的subnet，可以使用我代码中的cloudfortion去创建vpc
之后在vpc与subnet中创建一个key为environment的tag，value按照自己的环境进行区分例如prod/test/inf等(demo中为test)
创建成功之后在VPC中创建一台centos的EC2服务器，部署jenkins、terraform、python3、awscli，并赋予EC2对应的iam权限（测试给与administrator权限）
```
yum install epel* -y
yum install python3 git unzip  -y
pip3 install awscli
wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
unzip terraform_0.12.29_linux_amd64.zip
mv terraform /usr/local/bin
替换ami 权限为administrator
```
创建terraform目录
terraform 版本为0.12
terraform aws 插件为terraform-provider-aws_v2.70.0_x4
```
cd /opt
git clone https://github.com/yehecarry/rubydemo.git
cp -r rubydemo/terraform /opt
mkdir /opt/terraform/plugin
cd /opt/terraform/plugin
wget https://releases.hashicorp.com/terraform-provider-aws/2.70.0/terraform-provider-aws_2.70.0_linux_amd64.zip
unzip terraform-provider-aws_2.70.0_linux_amd64.zip
cd /opt/terraform/aws/ap-southeast-1/test-001
terraform init -input=false -plugin-dir=/opt/terraform/plugin
terraform plan
terraform apply -auto-approve
terraform output --json # 把对应的信息ip 注册到cmdb中
```

这样基础设置就创建完了

代码的缺陷，我设计的原理是只用添加一个账号，subnetid 通过填写az 随机获取到一个，但是目前terraform 不好做，所以在az为a 的区域创建服务器，如果想换az可以指定subnetid去创建

下面为持续集成的方式，因为没有环境，我只能提供我的Jenkinsfile 与共享库PIPELINE

我使用CI/CD 分离的方式进行部署  

CI gitlab更改代码触发CI，打包成docker推送到dockerhub（harbor）等仓库  
CD 通过api 去拉取docker仓库中的tag名称，通过cmdb选择ip，通过 ansible 进行部署
推荐使用kubernetes部署


如果时间充足 我会添加对应的工具链达到Devops的效果
- 持续集成
    - 代码版本库：Gitlab
    - 集成工具：Jenkins
    - 代码质控：Sonar
    - 单侧覆盖度：Jacoco
    - 制品管理：JFrog(nexus)
    - 项目管理：TAPD(JIRA)
    - 接口测试：Yapi
    - 性能测试：Jmeter
- 持续部署
    - 容器技术：Docker
    - 容器声明管理：Kustomize(helm)
    - 部署工具：ArgoCD
    - 服务网格：istio
    - 灰度发布：Flagger
- 可观测性
    - 可视化度量：Prometheus+Grafana
    - 全链路追踪：Elastic APM
