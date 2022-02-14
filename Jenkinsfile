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
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID yakhub4881/$JOB_NAME:v1.$BUILD_ID'
                sh 'docker image tag $JOB_NAME:v1.$BUILD_ID yakhub4881/$JOB_NAME:latest'
            }
        }
    }
}
