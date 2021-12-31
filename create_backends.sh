#!/bin/zsh
python3 update_state_buckets.py
cd gcs/terraform/tf_state_buckets
terraform apply -auto-approve