```
bundle install
bundle exec rackup -p 3000
```

�ҵ�Demo����AWS��ap-southeast-1 region ʵ�ֵ�
������AWS�ϴ���һ��VPC��VPC�д�����Ӧ��subnet������ʹ�����Ҵ����е�cloudfortionȥ����vpc�������ɹ�vpc֮����Ҫ���䴴����vpc��subnet����һ��keyΪenvironment��tag��ֵ�����Լ��Ļ���������������prod/test/inf��
�����ɹ�֮����VPC�д���һ̨centos��EC2������������jenkins��terraform��python3��awscli�����õ���Ӧ��iamȨ��access key�����Ը���administratorȨ�ޣ�
����terraformĿ¼
```
mkdir /opt/terraform/aws/ap-southeast-1
git clone 
```