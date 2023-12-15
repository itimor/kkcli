#!/usr/bin/env bash

_usage_module() {
    cat <<__EOF__

Some useful kkcli app java|front command args

$(_red Options):
     --project           specify project
     --host              specify deploy remote host
     --from              specify jar package abspath
     --env               specify environment
     --version           specify version
     --action            deploy|rollback|restart|stop
     -h,--help           lists all command help information

$(_red Example:)
    $(_blue Deploying a project, default localhost.)
     $ kkcli app java --project=kkcloud-agent --env=dev --from=/target/kkcloud-agent-biz-0.8.0-RELEASE.jar --version=22334db-2021-05-06-21-12 --action=deploy
    $(_blue Deploying a project, Specify host.)
     $ kkcli app java --project=kkcloud-agent --env=dev --host=10.10.10.3 --from=/target/kkcloud-agent-biz-0.8.0-RELEASE.jar --version=22334db-2021-05-06-21-12 --action=deploy
    $(_blue Deploying a project, Specify ansible inventory group.)
     $ kkcli app java --project=kkcloud-agent --env=dev --host=app01 --from=/target/kkcloud-agent-biz-0.8.0-RELEASE.jar --version=22334db-2021-05-06-21-12 --action=deploy

    $(_blue Rollbacking a project, default previous commit or tag.)
     $ kkcli app java --project=project --env=dev --host=app01 --action=rollback

    $(_blue Restart local project.)
     $ kkcli app java --project=project --env=dev --host=app01 --action=restart

    $(_blue Stop local project.)
     $ kkcli app java --project=project --env=dev --host=app01 --action=stop
__EOF__
}

_usage_service() {
    local service=${1}
    cat <<__EOF__

$(_blue Install ${service} command args)

$(_red Options):
    --host             specify host install ${service}
    --env              specify environment
    --action           install|restart|list ${service}
    -h,--help          lists all command help information

$(_blue Example:)
    $(_red Install ${service})
     $ kkcli soft --host=app01 --env=dev --service=filebeat --action=install
    $(_red Restart ${service}, specify host.)
     $ kkcli soft --host=app01 --env=dev --service=filebeat --action=restart
    $(_red List all ${service}.)
     $ kkcli soft --action=list
__EOF__
}