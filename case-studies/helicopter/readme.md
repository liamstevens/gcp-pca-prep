# Helicopter Racing League

## Technologies in Use
- Object storage in current cloud provider
- Video en/trans/coding performed on VMs that are created on a per-job basis
- Race predictions perfomed using Tensorflow on dedicated VMs

## Requirements
- Expose predictive models to partners (aka: present API endpoint)
- Increase predictive capabilities before and during races
    - Race results
    - Mechanical failures
    - Crowd sentiment
- Additional telemetry and associated insights
- New predictive models (engagement)
- Global availability
- Increase concurrent viewer count
- Minimise operational complexity
- Ensure regulatory compliance
- Create merchandising revenue stream

## Initial suggested Google stacks
- Cloud CDN for global access to resources
- Apigee API presentation for partner consumption
- Cloud ML
    - Predictive models for race results and mechanical failures
    - Cloud Natural Language API tied to race chat rooms/transcribed audio
    - Engagement models tied to the above
- Cloud Run/Cloud Function for en/trans/coding of videos
- Cloud Storage Buckets for object storage (videos and other)

## Suggested Architecture
![Suggested System Architecture](https://lucid.app/publicSegments/view/d10b3ff8-e9c1-46f5-87fa-16f7ca03caab/image.png)