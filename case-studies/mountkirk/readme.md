# Mountkirk Games

## Technologies in Use
- Kubernetes
- GPUs 

## Requirements
- Low Latency
- High scalability
- Strongly consistent real-time datasets
- Pooled resources
- GPU rendering of resources
- Activity logs in structured files

## Initial suggested Google stacks
- GKE
    - Multi-region clusters
    - Probably multiple node pools in order to flex for demand
    - Enables pooling of resources by provisioning tenant applications within namespaces or dedicated node pools
    - Enables rendering by fixing affinities of rendering tasks to GPU enabled pools
    - Will require some clever scheduling configuration in order to ensure there are services deployed appropriately, potentially may require running them as daemonsets
- Cloud Spanner
    - Multi-region Cloud Spanner implementation for real-time leaderboards and other datasets
- Cloud Storage
    - Storing structured log files for future analysis
- Global Load Balancer
    - Anycast routing allows for BGP negotiated lowest-cost routing paths
    - Multiple backends (served in each zone the cluster is present in)

## Suggested Architecture
![Suggested System Architecture](https://lucid.app/publicSegments/view/8e31215f-1947-4a2c-96a1-e99f7cfb038c/image.png)
