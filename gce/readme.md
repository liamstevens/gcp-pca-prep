# Google Compute Engine (aka GCE)
## What is it?
GCE is used broadly for a number of purposes, but perhaps the best way to summarise it is "VM as a service". You are in charge of a lot here as this is true IaaS. Machine image, resources available to the VM, network connectivity, patching of the OS and any installed software, etc. etc. etc. All your responsibility. All Google does is provision the infrastructure to be available for you according to your instruction.
## Why use it?
GCE is pretty handy if you've got a traditional workload that you need to lift and shift into the cloud. Monolithic applications (I'm looking at you, SAP) that aren't easily reworked to make use of containerisation, or into a serverless architecture. It's also by far the simplest way of setting up basic functionality if you need something quick and dirty and you'd rather do an `yum install postgres` than try to set up a full Cloud SQL instance.
## Related/Requisite Services
### VPC
First and moremost related is networking. VPC covers a large number of these components, but this includes things like the underlying network and subnet that the instance sits in, firewall rules (and network tagging), routing, DNS, and so on. VPC is heavily intertwined with many services (server or serverless) in GCP, so this relationship with GCE is not unique by any means.
### Managed Instance Groups (MIGs)
Managed instance groups are technically a subset of GCE, rather than a related service. but they really do deserve to have a section dedicated to them. MIGs are a way of creating and dealing with a fleet of virtual machines as a single entity rather than individually. MIGs are configurable with autoscaling, autohealing, and auto-updating. They also natively support integrations with Google's Cloud Load Balancing service, in order to allow access to the application that you're running on them. 

MIGs can be run according to a number of different scaling strategies in order to your needs.