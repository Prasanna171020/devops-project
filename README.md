# devops-project#  
DevOps Project – CI/CD, Containerization, and Infrastructure as Code
This project demonstrates a complete DevOps pipeline for a Spring Boot application using Jenkins, Docker, and Terraform.

## CI/CD with Jenkins

 The pipeline is defined in `Jenkinsfile` and includes four stages:
  1. **Lint** – runs Checkstyle to enforce code quality.
  2. **Test** – executes unit tests with Maven.
  3. **Build** – packages the application into an executable JAR.
  4. **Deploy** – builds a Docker image and runs a container on the same EC2 instance.
    Jenkins uses the system‑installed Maven and JDK.

## Docker

`Dockerfile` is based on `amazoncorretto:17-alpine` and copies the pre‑built JAR.
`docker-compose.yml` provides a simple way to run the container locally.
 The container is deployed on port `8081` to avoid conflict with Jenkins.

## Infrastructure as Code (Terraform)

The `terraform/` directory contains `main.tf`, which defines:
A security group named `MYSG` with inbound rules for SSH (22) and Jenkins (8080‑8081)
An EC2 instance (t2.micro) using an existing key pair.
An S3 bucket.
  
