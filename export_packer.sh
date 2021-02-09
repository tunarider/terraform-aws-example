#!/bin/bash
terraform output -json | jq 'with_entries(select(.key|contains("packer-"))) | with_entries(.value |= .value) | with_entries(.key = (.key | sub("packer-";"")))'
