properties([parameters([booleanParam(defaultValue: false, description: 'ticks to include init step', name: 'includeInit'), choice(choices: ['apply', 'destroy'], description: 'select apply or destroy which to include', name: 'applyORdestroy')])])

pipeline{
    agent any
    tools {
        terraform 'terraform'
    }  



    stages{
        stage("Git Checkout"){
            steps{
                git credentialsId: 'e4583a96-72a0-4803-8ccc-66d5f94d33b5', url: 'https://github.com/SharjeeLZeon/jenkinsterraform'
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
