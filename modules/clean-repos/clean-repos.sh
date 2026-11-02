#!/usr/bin/env bash
set -euo pipefail

echo "=== Processing EL10 Repositories ==="

# todo: make this a variable
ALLOWED_REPOS=("appstream" "baseos" "crb" "epel" "extras-common")

ACTIVE_REPOS=$(grep -h "^\[.*\]" /etc/yum.repos.d/*.repo 2>/dev/null | tr -d '[]' | sort -u)

for repo in $ACTIVE_REPOS; do
    [ -z "$repo" ] && continue
    case " ${ALLOWED_REPOS[*]} " in
        *" $repo "*)
            echo "Keeping allowed repository: $repo"
            ;;
        *)
            echo "Physically purging unallowed/duplicate repository configuration: $repo"
            sed -i "/^\[${repo}\]/,/^$/d" /etc/yum.repos.d/*.repo 2>/dev/null || true
            ;;
    esac
done

dnf clean all
