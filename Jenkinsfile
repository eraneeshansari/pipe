pipeline{
   agent any
environment {
  DOCKER_TAG = getVersion()
}

   stages{
// Docker Image Build Code
       stage('Docker Image Build'){
            steps{
                sh "docker build . -t 966145/myimagnov:${DOCKER_TAG}"
            }
       }
// Docker Push Code 
       stage('Docker Image Pust to Docker Hub'){
          steps{
             withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhubpass')]) {
               sh "docker login -u 966145 -p ${dockerhubpass}"
               sh "docker push 966145/myimagnov:${DOCKER_TAG}"
           }    
          }
       }
// Deploy mypod.yaml in k8s cluster
       stage('Deploy pod in Kops Cluster'){
          steps{
             sshagent(['ec2']) {
             sh "scp -o StrictHostKeyChecking=no mypod.yaml  ec2-user@3.7.71.231:/home/ec2-user/"
                 script{
		    try{
		       sh "ssh ec2-user@3.7.71.231 kubectl apply -f ."				 
		       }
		    catch(error){
		        sh "ssh ec2-user@3.7.71.231 kubectl create -f ."
		               }
                      }
             }
          }
       }

         } 




}


def getVersion() {
     def commitid = sh returnStdout: true, script: 'git rev-parse --short HEAD' 
     return commitid
}
