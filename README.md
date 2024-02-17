# Automating Web Deployment on Cloud

<p align="center">
  <img src="./assets/cover.png" width="500" alt="Cloud Web deploy">
</p>

This repository addresses the automation of web deployment on the cloud in multiple phases. It involves setting up a basic web application deployment to serve static files using Docker, Terraform, and Kubernetes. The provided code focuses on a specific aspect of this process, which includes building the Docker image, updating Terraform code with the latest tag, and creating a pull request in Git as part of the continuous integration (CI) process. Once the code is merged into the main branch, it triggers a Terraform plan in the Terraform code, deploying and exposing the application in Kubernetes

## Tools Used

1. [**Docker**](): _Containerization platform used to build and manage Docker images._
2. [**Bash Scripting**](): _Utilized for scripting tasks and automation within the deployment process._
3. [**Python**](): _Programming language used for scripting and automation tasks, such as interacting with APIs and manipulating YAML files._
4. [**Git**](): _Version control system used for managing code changes, branches, and pull requests._
5. [**Terraform**](): _Infrastructure-as-Code (IaC) tool used to provision and manage cloud resources._
6. [**Kubernetes**](): _Container orchestration platform used to deploy, scale, and manage containerized applications._
7. [**Terratest**](): _Go library for testing infrastructure code, to test the terraform code._
8. [**GitHub Actions**](): _CI/CD platform integrated with GitHub repositories to automate workflows and tasks._
9. [**Terraform Cloud**](): _Cloud-based service for collaborative Terraform workflows, including execution and management of Terraform plans._

## Workflow Overview

![turo-cloud-assignment](https://github.com/GirishCodeAlchemy/TuroAutomateCloudWebDeploy/assets/143807663/acf8f64e-d7f4-487e-a6ca-f027f78c147f)

## Phase1: [Build and Push Docker Image](https://github.com/GirishCodeAlchemy/TuroAutomateCloudWebDeploy/actions/workflows/docker-build.yaml)

This phase automates the process of building and pushing Docker images. Here's how it works:

1. **Automatic Trigger**: The process is automatically triggered if there is any pull request and changes are detected in the Docker folder.

2. **Image Tag Version**: By default, the image tag version is set to `DOCKER_TAG=0.${github.run_number}.${github.event.number}-dev`. This ensures that each build has a unique version identifier.

3. **Custom Image Tag**: Users have the option to provide their own image tag. They can do this by navigating to the GitHub Actions workflow and modifying the image tag parameter.

4. **Workflow Execution**:
   - The workflow starts with the setup of the environment.
   - Phase 1 involves building the Docker image and pushing it to the Docker registry.
   - Once completed, Phase 2 will commence, which involves updating the Terraform code.

This phase streamlines the process of Docker image management, ensuring consistency and reliability in the deployment pipeline.
![Buildthe version tag](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/09f7c3d3-11e7-47c2-8b9d-a96ac60967c6)
![githubaction-build](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/3b239254-edcb-4957-9c63-78dcb5c1d330)
![phase1](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/e73f7631-56d0-4331-9bab-4f6992ffc1d1)
![dockerhub](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/40fc37a3-6ebd-4e04-be38-834974b51fde)

---

## Phase2: [Update Image Tag and Create PR](https://github.com/GirishCodeAlchemy/TuroAutomateCloudWebDeploy/actions/workflows/deploy-image.yaml)

This phase handles the updating of the image tag and the creation of pull requests. Here's a breakdown of the process:

1. **Continuous Integration**: This phase integrates the updated image tag into the deployment pipeline, ensuring smooth and continuous deployment.

2. **Image Tag Update**: The image tag is updated as part of this phase to reflect the changes made to the Docker image. This ensures that the latest version of the image is used for deployment.

3. **Terraform Plan**: The Terraform plan is generated to assess the impact of the changes made to the infrastructure. This step provides insight into the modifications that will be applied during the deployment process.

4. **Pull Request Creation**:

   - Once the image tag is updated and the Terraform plan is generated, a pull request is created automatically.
   - The pull request includes the proposed changes to the infrastructure, allowing for review and validation before deployment.

5. **Workflow Execution**:
   - The workflow starts with the setup of the environment.
   - Phase 2 involves updating the image tag, and generating the Terraform plan on the creation of the pull request.
   - Upon completion, Phase 3 will begin, which involves reviewing the Terraform plan and applying the changes.

This phase ensures that changes to the Docker image and infrastructure are properly evaluated and integrated into the deployment pipeline, maintaining the reliability and stability of the application.

![Continuous Integration](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/34039b99-23c3-451c-a749-9a9ec80a0032)
![pr created](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/7c674ec7-a8a4-4b92-a65d-85947f2d8d11)
![Terratest](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/d76e5807-fb89-47d8-bc5b-357f756b8c17)
![terraplan](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/68826bee-31d1-49b8-944e-bba1e58a5f7c)
![Merge](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/28c06727-3123-42b3-8560-1d4544ff087a)

---

## Phase3: [Deploy the Changes](https://app.terraform.io/app/aws-app-hosting/workspaces/TuroAutomateCloudWebDeploy/runs)

This phase focuses on deploying the changes to the infrastructure and application. Here's a detailed overview:

1. **Review and Approve**:

   - Before deployment, the changes proposed in the Terraform plan are reviewed and approved. This step ensures that any modifications to the infrastructure meet the necessary requirements and standards.

2. **Deployment Process**:

   - Once the changes are reviewed and approved, the deployment process is initiated.
   - The Terraform configuration is applied to the target environment, implementing the proposed changes to the infrastructure.

3. **UI Access**:

   - After successful deployment, users can access the deployed application via the provided UI link.
   - The link directs users to the application interface, where they can interact with the updated features and functionalities.

4. **Workflow Integration**:
   - Phase 3 is seamlessly integrated into the deployment workflow, following the completion of Phase 2.
   - The deployment process ensures that changes are effectively applied to the infrastructure, maintaining the availability and performance of the application.

This phase completes the deployment cycle, ensuring that changes to the infrastructure and application are successfully deployed and accessible to users. It emphasizes the importance of thorough review and approval processes to maintain the reliability and stability of the deployed environment.

![image](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/8f39469a-cadf-44d1-a3bc-1b95f9629efb)

![image](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/173e9ac2-958e-4d8f-947c-4f48c00625a7)
<img width="1550" alt="image" src="https://github.com/GirishCodeAlchemy/TuroAutomateCloudWebDeploy/assets/143807663/da35b2b5-0e24-48f5-9e78-f56dc1a090b4">

### [Access the UI](https://girishcodealchemy.test-subaccount-1-v02.test-subaccount-1.rr.mu/)

![image](https://github.com/GirishCodeAlchemy/AutomateCloudWebDeploy/assets/143807663/938745d9-2bad-449f-ab6b-b6830df3200a)
