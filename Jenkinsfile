pipeline {
   agent any
   stages {
      stage('CodeScan') {
         steps {
            sh 'trivy fs . -o result.html'
            sh 'cat result.html'  // Fixed the typo
         }
      }
      stage('dockerImageBuild') {
         steps {
            sh 'docker -v'
         }
      }
      stage('pushImage') {
         steps {
            sh 'docker ps'
         }
      }
   } // Closed the stages block properly
}
