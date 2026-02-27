**############################################🚀 Chai Kafe DevOps Project#####################################################**
Chai Kafe is a Spring Boot-based web application that demonstrates a complete DevOps CI/CD pipeline using:
GitHub (Source Control)
Maven (Build Tool)
Docker (Containerization)
AWS EC2 (Server)
AWS ECR (Container Registry)
Jenkins (CI/CD Automation)
IAM Role (Secure AWS Access)

**##########################################🏗️ Architecture ############################################**

                          Developer → GitHub → Jenkins → Docker → AWS ECR

**🛠️ Step 1: Application Development**

Created Spring Boot application
Added Web + Actuator dependencies
Created simple café portal endpoints:
/
/menu
/about
/contact

Verified Using: http://localhost:8080(locally)

**🐳 Step 2: Dockerization**
**Dockerfile**
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY target/task-manager-api-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

**Multi stage :**
# Stage 1 - Build
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
# Stage 2 - Runtime
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/task-manager-api-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

**☁️ Step 3: AWS Setup**
EC2 Configuration
Amazon Linux
Docker installed
Jenkins installed
IAM Role attached
IAM Role Permissions:AmazonEC2ContainerRegistryFullAccess
Verified IAM:aws sts get-caller-identity

**📦 Step 4: AWS ECR**
aws ecr create-repository --repository-name chai-kafe-app
**Logged in:**
aws ecr get-login-password --region us-east-1 \
| docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com

**🔄 Step 5: Jenkins CI/CD Pipeline**
Created Jenkinsfile:
Clone repository
Build using Maven
Build Docker image
Login to ECR
Tag image
Push image
Pipeline fully automated.

