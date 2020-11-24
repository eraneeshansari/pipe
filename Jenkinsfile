pipeline{
   agent any
   stages{
// Docker Image Build Code
       stage('Docker Image Build'){
            steps{
                sh "docker build . -t 966145/myimagnov:latest"
            }
       }
// Docker Push Code 
       stage('Docker Image Pust to Docker Hub'){
          steps{
             withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubpass')]) {
               sh "docker login -u 966145 -p ${dockerhubpass}"
               sh "docker push 966145/myimagnov:latest"
           }    
          }

       }

         } 




}
