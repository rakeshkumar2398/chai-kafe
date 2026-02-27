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
Dockerfile
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY target/task-manager-api-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

Multi stage 
