# 集成ansistrano和ansible的运维工具

## 功能
- 发布
- 重启
- 回滚
- 停止
- 安装软件
- 同步配置

## 目录结构
```
├── ansible
│   ├── deploy-java.yml             # 部署java服务的playbook
│   ├── deploy-node.yml             # 部署front服务的playbook
│   ├── restart-default.yml         # 重启脚本
│   ├── stop-default.yml            # 停止脚本
│   ├── roles                       # 发布playbook和软件安装playbook
│   ├── rollback-default.yml        # 回滚脚本
│   ├── services.yml                # 服务启动文件分发
│   └── soft.yml                    # 软件安装
├── ansible.cfg                     # ansible配置
├── install                         # kkcli安装脚本
├── inventory                       # host管理；后缀区分环境
│   ├── hosts-all
│   ├── hosts-dev
│   ├── hosts-prod
├── jenkins_job_config              # Jenkins的jobs配置
│   ├── front_jobs_confi.xml
│   └── java_jobs_config.xml
├── kkcli                           # 核心命令
├── lib                             # 核心脚本
│   ├── color.sh
│   ├── install.sh
│   ├── usage.sh
│   └── util.sh
├── module                          # 发布模块
│   ├── front
│   └── java
├── plugins                         # kkcli模块
│   ├── app
│   └── soft
└── readme.md
```

## 使用
### app|发布
```
kkcli app java
```
使用说明
```
Some useful kkcli app java|front command args

 Options :
     --project           specify project
     --host              specify deploy remote host
     --from              specify jar package abspath
     --env               specify environment
     --version           specify version
     --action            deploy|rollback|restart|stop
     -h,--help           lists all command help information

 Example: 
     Deploying a project, default localhost. 
     $ kkcli app java --project=kkcloud-agent --env=dev --from=/target/kkcloud-agent-biz-0.8.0-RELEASE.jar --version=22334db-2021-05-06-21-12 --action=deploy
     Deploying a project, Specify host. 
     $ kkcli app java --project=kkcloud-agent --env=dev --host=10.10.10.3 --from=/target/kkcloud-agent-biz-0.8.0-RELEASE.jar --version=22334db-2021-05-06-21-12 --action=deploy
     Deploying a project, Specify ansible inventory group. 
     $ kkcli app java --project=kkcloud-agent --env=dev --host=app01 --from=/target/kkcloud-agent-biz-0.8.0-RELEASE.jar --version=22334db-2021-05-06-21-12 --action=deploy

     Rollbacking a project, default previous commit or tag. 
     $ kkcli app java --project=project --env=dev --host=app01 --action=rollback

     Restart local project. 
     $ kkcli app java --project=project --env=dev --host=app01 --action=restart

     Stop local project. 
     $ kkcli app java --project=project --env=dev --host=app01 --action=stop
```

### soft|软件
```
kkcli soft
```
使用说明
```
 Install soft command args 

 Options :
    --host             specify host install soft
    --env              specify environment
    --action           install|restart|list soft
    -h,--help          lists all command help information

 Example: 
     Install soft 
     $ kkcli soft --host=app01 --env=dev --service=filebeat --action=install
     Restart soft, specify host. 
     $ kkcli soft --host=app01 --env=dev --service=filebeat --action=restart
     List all soft. 
     $ kkcli soft --action=list
```
软件列表
```
kkcli soft --action=list
```
```
$ kkcli soft --host=app01 --env=dev --service=jdk --action=install
$ kkcli soft --host=app01 --env=dev --service=filebeat --action=install
$ kkcli soft --host=app01 --env=dev --service=nginx --action=install
$ kkcli soft --host=app01 --env=dev --service=docker --action=install
$ kkcli soft --host=app01 --env=dev --service=n9e --action=install
$ kkcli soft --host=app01 --env=dev --service=zabbix --action=install
$ kkcli soft --host=app01 --env=dev --service=dns --action=install
$ kkcli soft --host=app01 --env=dev --service=skywalking --action=install
```


## 更新
```
kkcli --update
```