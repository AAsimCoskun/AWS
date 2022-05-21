#!/bin/bash

set -euo pipefail
# set -x

cd "$(git rev-parse --show-toplevel)"

for env in cmp-az-{dev,stg,prd,prf}; do
  for dir in "$env/"*; do
    [ -d "$dir" ] || continue
    if [ ! -f "$dir/terraform.tfvars" ]; then
      touch "$dir/terraform.tfvars"
    fi
    if ! grep -w '^env' "$dir/terraform.tfvars" | grep -wq "\"$env\""; then
      (
        echo 'env = "'$env'"' # make it first line
        grep -wv '^env' "$dir/terraform.tfvars" || :
      ) > TEMP.tfvars
      mv TEMP.tfvars "$dir/terraform.tfvars"
      terraform fmt "$dir/terraform.tfvars"
      git add "$dir/terraform.tfvars"
    fi
  done
done
