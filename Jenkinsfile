node {
  
      stage('checkout') {
           
                git credentialsId: '9438d8c0-e9ed-4c1f-8a1a-389c9932918c', url: 'https://github.com/Aarushmohan/ci-cd.git'
             
          
        }
	

  stage('Docker Build and Tag') {
           
                dockerImage = docker.build("mohanaarush/samplewebapp:latest")
                
               
         
        }
     
  stage('Publish image to Docker Hub') {
          
           
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
          dokcerImage.push()
        //  sh  'docker push nikhilnidhi/samplewebapp:$BUILD_NUMBER' 
     
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
           
                sh "docker run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            
        }
 stage('Run Docker container on remote hosts') {
             
                sh "docker -H ssh://jenkins@10.12.124.82 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            
        }
    }
	
