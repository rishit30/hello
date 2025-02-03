bash
#!/bin/bash

# Build Docker Image
docker build -t testing-app .

# Log in to ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com

# Tag Docker Image
docker tag testing-app:latest ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/testing-app:latest

# Push Docker Image
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.us-east-1.amazonaws.com/testing-app:latest

# Register Task Definition
aws ecs register-task-definition --cli-input-json file://task-definition.json

# Update ECS Service
aws ecs update-service --cluster testing-app-cluster --service testing-app-service --force-new-deployment