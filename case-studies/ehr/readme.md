# EHR Healthcare

## Technologies in Use
- Microsoft Active Directory
- MSSQL
- MySQL
- Redis
- MongoDB
- Containerised applications

## Requirements
- Current stack remains in-use (no changes to stack, only replication of stack as co-location replacement)
- 99.9% Availability
- Centralised Monitoring and Alerting
- Multiple environment management
- Dynamic environment scaling
- Dynamic environment provisioning
- Low latency connection to on-premise

## Initial suggested Google stacks
- GCE Instance to act as AD slave
- GDS integration with AD
- GKE for containerised workloads
- Cloud SQL for MySQL and MSSQL
- Managed Redis cache
- Google Cloud Datastore/GCE/Managed MondoDB Atlas for NoSQLL
- Cloud Interconnect between on-prem and VPC


## Suggested Architecture
![Suggested System Architecture](https://lucid.app/publicSegments/view/acb9b3ae-9aec-477a-8579-483e7feb05d5/image.png)