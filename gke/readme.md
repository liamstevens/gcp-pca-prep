# GKE

## What is it?
GKE stands for Google Kubernetes Engine and is a way of accessing Kubernetes infrastructure on GCP without going about it the hard way. GKE is a managed service and has substantial flexibility in how you utilise this management - ranging from automatic node pools to master plane upgrades. You pay a small fee for management overhead ($0.10 at the time of writing) in addition to the cost to run the instances that host the node pool.
## Why use it?
GKE is a great option for getting your containerised applications into the cloud - if you and/or your team have some level of experience with Kubernetes. You can do away with worrying about Kubernetes version upgrades - Google upgrades the master plane automatically and will upgrade your nodes inline with the maintenance window and release channel that you specify. You also get access to a bunch of enhancements that Google have added natively to GKE like sandboxing and Workload Identity.
## When not to use it
Don't use GKE if you don't know Kubernetes. You're setting yourself up for pain. Use App Engine instead if your application can be fitted to it.
## Related/Requisite Services

### Autopilot
Autopilot clusters take even more management out of your hands and give it to Google. You pay an additional fee for this, but you don't pay to run your nodes - because Google manages even these, you simply pay for the CPU and memory that your pods request. For a full rundown on the differences between Autopilot and standard clusters, see [here](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview#comparison).

### VPC
If you're using GKE, you almost certainly need familiarity with VPC in order to get a working cluster deployed and accessible. For instance, you will need to provide a CIDR for the control plane if you are using a private cluster.