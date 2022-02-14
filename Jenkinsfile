pipeline{
    agent any
    stages
    {
        stage ("checkout from scm")
        {
            steps
            {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yakhub4881/docker-project.git']]])
            }
        }
        stage ('build docker image')
        {
            steps{
                sh 'docker build -t $JOB_NAME:v1.$BUILD_ID .'
                sh 'docker tag webappimage:v1 yakhub4881/webappimage:v1'
                sh 'docker tag webappimage:v1 yakhub4881/webappimage:latest'
            }
        }
    }
}
