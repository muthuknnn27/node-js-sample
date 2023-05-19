node
{
    
    stage('CheckoutCode')
    {
        git credentialsId: 'c027712f-ee55-4a6b-af5e-7e4298e1d033', url: 'https://github.com/muthuknnn27/node-js-sample.git'
    }
    
    stage('Build')
    {
        sh "npm install"
    }
    
    stage('Docker build')
    {
        sh "docker build -t nodejs_devops_sample_project ."
    }
    
    stage('Build and Push Docker Image') {
        withCredentials([string(credentialsId: 'e34387af-d06b-43ea-9275-0d42a7f8b62d', variable: 'DOCKER_CREDENTIALS')]) {
            
            sh "docker login -u muthuknnn27 -p ${DOCKER_CREDENTIALS}"
            sh "docker tag nodejs_devops_sample_project muthuknnn27/nodejs_devops_sample_project"
            sh "docker push muthuknnn27/nodejs_devops_sample_project"
        }
    }
    
    stage('Remove Previous Container'){
	    try{
		        sh 'docker rm -f nodejs_container'
	    }catch(error){
		//  do nothing if there is an exception
	    }
    }
    
    stage('Docker deployment')
    {
        sh 'docker run -d -p 5000:5000 --name nodejs_container muthuknnn27/nodejs_devops_sample_project' 
    }
}
