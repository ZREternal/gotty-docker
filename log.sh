#!/bin/bash

main() {
    target="${1}"
    keyWork="${2}"
    if [[ -z "${target}" ]]; then
        echo "empty arg"
        exit 1
    fi

    if [[ -z "${keyWork}" ]]; then
        grepTarget=""
    else
        grepTarget="|grep ${keyWork}"
    fi

    case "${target}" in
    "messages")
        eval tail -f /var/log/messages ${grepTarget}
        ;;
    "k8s示例")
        eval kubectl logs -f -n namespace $(kubectl get pods -n namespace | grep podname | awk '{print $1}') ${grepTarget}
        ;;
    "docker示例")
        eval docker logs -f $(docker ps -a |grep container_name |awk '{print $12}') ${grepTarget}
        ;;
    *)
        echo "default (none of above)"
        ;;
    esac
}

main "$@"
