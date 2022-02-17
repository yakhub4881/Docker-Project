pipeline{
    agent any
    stages
    {
        stage ("checkout from SCM")
        {
            steps
            {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yakhub4881/docker-project.git']]])
            }
        }
        stage ("build docker image")
        {
            steps{
                sh 'docker build -t nginximage:v1.$BUILD_ID .'
            }
        }
        stage ("push image to docker hub")
        {
            steps{
                withCredentials([string(credentialsId: 'DockerPasswd', variable: 'DockerPasswd')]) {
                sh "docker login -u yakhub4881 -p ${DockerPasswd}"
                sh 'docker tag nginximage:v1.$BUILD_ID yakhub4881/nginximage:v1.$BUILD_ID'
                sh 'docker push yakhub4881/nginximage:v1.$BUILD_ID'
                 }
            }
        }
        stage ("Deploy Container on Webapp Server")
        {
            steps{
                sshagent(['webapp-nginx-server']) {
                sh 'ssh -o StrictHostKeyChecking=no centos@172.31.34.231 docker run -itd --name webappcontainer -p 9000:80 yakhub4881/nginximage:v1.1'
                 }  
            }
        }
    }
}
