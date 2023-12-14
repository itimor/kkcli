#!/usr/bin/env bash
#

_install_service() {
    local service=${1}
    local host=${2}
    local env=${3}
    
    ansible-playbook -b -i ${KKPATH}/inventory/hosts-${env} ${KKPATH}/ansible/soft.yml -v \
                     -t ${service} -e "app_host=${host} app_env=${env}"
}

############ Restart ############
_restart_default_project() {

    local project_name=$1
    local project_host=$2
    local project_env=$3

    ansible-playbook -i ${KKPATH}/inventory/hosts-${project_env} ${KKPATH}/ansible/restart-default.yml -v \
                     -e "app_name=${project_name} app_host=${project_host}"
}

############ Rollback ############
_rollback_default_project() {
    local project_name=$1
    local project_host=$2
    local project_env=$3

    ansible-playbook -b -i ${KKPATH}/inventory/hosts-${project_env} ${KKPATH}/ansible/rollback-default.yml  -v \
                     -e "app_name=${project_name} app_host=${project_host}"
}

########### Deploy #############

_deploy_java_project() {

    local project_name=$1
    local project_version=$2
    local project_host=$3
    local project_from=$4
    local project_jar_name=$5
    local project_env=$6
    local project_nacos=$7

    ansible-playbook -b -i ${KKPATH}/inventory/hosts-${project_env} ${KKPATH}/ansible/deploy-java.yml -v \
                     -e "app_name=${project_name} \
                         app_version=${project_version} \
                         app_host=${project_host} \
                         app_from=${project_from} \
                         app_jar_name=${project_jar_name} \
                         app_env=${project_env} \
                         app_nacos=${project_nacos}"
}

_deploy_node_project() {

    local project_name=$1
    local project_version=$2
    local project_host=$3
    local project_from=$4
    local project_env=$5

    ansible-playbook -b -i ${KKPATH}/inventory/hosts-${project_env} ${KKPATH}/ansible/deploy-node.yml -v \
                     -e "app_name=${project_name} \
                         app_version=${project_version} \
                         app_host=${project_host} \
                         app_from=${project_from}"
}

_deploy_golang_project() {

    local project_name=$1
    local project_version=$2
    local project_host=$3
    local project_from=$4
    local project_env=$5

    ansible-playbook -b -i ${KKPATH}/inventory/hosts-${project_env} ${KKPATH}/ansible/deploy-golang.yml  -v \
                         -e "app_name=${project_name} \
                             app_version=${project_version} \
                             app_host=${project_host} \
                             app_from=${project_from} \
                             app_env=${project_env}"
}
