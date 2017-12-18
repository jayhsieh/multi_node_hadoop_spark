sudo su -c "passwd root; passwd jay_cc_hsieh; passwd ubuntu; sed -i 's/PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config; sed -i 's/PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config;"
sudo apt install default-jdk ssh rsync -y
#ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat user_env >> ~/.bashrc
source ~/.bashrc
mkdir ~/software && cd ~/software
wget http://apache.stu.edu.tw/hadoop/common/hadoop-2.9.0/hadoop-2.9.0.tar.gz
tar -zxvf hadoop-2.9.0.tar.gz
sudo mv hadoop-2.9.0 /usr/local/hadoop
cd ~/single_node_hadoop_spark/hadoop_2.9.0
cp -f *.xml /usr/local/hadoop/etc/hadoop/.
cp -f hadoop-env.sh /usr/local/hadoop/etc/hadoop/.
sudo mkdir -p /usr/local/hadoop/hadoop_data/hdfs/namenode
sudo mkdir -p /usr/local/hadoop/hadoop_data/hdfs/datanode
sudo chown ubuntu:ubuntu -R /usr/local/hadoop/
hadoop namenode -format

