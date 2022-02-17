pipeline {
    agent {
        docker {
            image 'kennethreitz/pipenv:latest'
            args '-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('test') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: 'master']], userRemoteConfigs: [[url: 'https://github.com/palogitjl/terragoat.git']]])
                script { 
                    sh "export PRISMA_API_URL=https://api.prismacloud.io"
                    sh "pipenv install"
                    sh "pipenv run pip install bridgecrew"
                    sh "pipenv run bridgecrew --directory . --bc-api-key 877c6c92-7d04-45a8-ab7c-a7a0afecec58::FGKv6lGRdGvjOXJQePEHnxV0gs8= --repo-id jlohoue_paloaltonetworks_com/Terracnfgoat"
                }
            }
        }
    }
    options {
        preserveStashes()
        timestamps()
    }
}
