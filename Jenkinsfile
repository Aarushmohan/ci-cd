node {
	
	
      stage('checkout') {
                git credentialsId: 'github', url: 'https://github.com/Aarushmohan/ci-cd.git'
        }
	
	 stage('Execute Maven') {
          
             
                sh 'mvn package'             
          
        }
	
     stage('Docker Build and Tag') {
                dockerImage = docker.build("mohanaarush/samplewebapp:latest")
        }
     
  stage('Publish image to Docker Hub') {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
          dockerImage.push()
          }
        }
     stage('push the artifacts to nexus')
	{
		nexusArtifactUploader(
		            nexusVersion:"nexus3", 
                            protocol:"http", 
                            nexusUrl: "10.12.124.82:8081",
                            groupId: 'com.test',
                            version: '0.0.2-SNAPSHOT',
                            repository:'database',
                            credentialsId:'nexus' ,
                            artifacts: [
                                [artifactId:'Database' ,
                                classifier: '',
                                file: 'target/LoginWebApp-1.war',
                                type: 'war']
                            ]
			);
	}      
       
   	
	      stage('Run Docker container on Jenkins Agent') {
            
                sh "docker run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            }
   /* 
 stage('Run Docker container on remote hosts') {
             
            
                sh "docker -H ssh://jenkins@10.12.124.82 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
 }*/
}	
