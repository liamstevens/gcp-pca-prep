# Withholding from any TF resources as there are limitations in the Cloud ML/AI/Vertex APIs that 
# result in state drift not being detected. These resources should instead be created in the 
# console. They are serverless solutions and Cloud Function should connect to fetch results from trained
# models.