pipeline {
   agent any
   environment {
      ECR_REPO = "819313480446.dkr.ecr.us-east-1.amazonaws.com/jenkins-ci"
      AWS_REGION = "us-east-1"
   }
   stages {
      stage('CodeScan') {
         steps {
            sh 'trivy fs . -o result.html'
            
         }
      }
      stage('DockerLogin') {
         steps {
            sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_REPO'
         }
      }
      stage('DockerBuild') {
         steps {
            sh 'docker build -t jenkins-ci .'
         }
      }
      stage('DockerTag') {
         steps {
            sh 'docker tag jenkins-ci:latest $ECR_REPO:latest'
            sh 'docker tag jenkins-ci:latest $ECR_REPO:v15.${BUILD_NUMBER}'
         }
      }
      stage('PushImage') {
         steps {
            sh 'docker push $ECR_REPO:latest'
            sh 'docker push $ECR_REPO:v1.${BUILD_NUMBER}'
         }
      }
   }
}
