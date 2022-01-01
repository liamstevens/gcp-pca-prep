#!/bin/zsh
python3 update_state_buckets.py
cd gcs/terraform/tf_state_buckets
terraform init
terraform apply -var-file=$1 -auto-approve 