properties([parameters([booleanParam(defaultValue: false, description: 'tickmark to include init step', name: 'includeInit'), choice(choices: ['apply', 'destroy'], description: 'select apply or destroy which to include', name: 'applyORdestroy')])])

pipeline{
    agent any
    tools {
        terraform 'terraform'
    }  



    stages{
        stage("Git Checkout"){
            steps{
                git credentialsId: '69cd91316b79425175e45e39052b425dc2cb4eb3', url: 'https://github.com/SharjeeLZeon/jenkinsterraform.git'
            }
        }


        stage('Terraform init'){
            when{
                expression{
                    params.includeInit == true
                }
            }
            steps{
                sh 'terraform init'
            }
        }



        stage('Terraform apply'){
            when{
                expression{
                    params.applyORdestroy == 'apply'
                }
            }
            steps{
                sh 'terraform apply --auto-approve'
            }
            }



        stage('Terraform destroy'){
            when{
                expression{
                    params.applyORdestroy == 'destroy'
                }
            }
            steps{
                sh 'terraform destroy --auto-approve'
            }
        }



    }
}