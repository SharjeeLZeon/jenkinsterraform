properties([parameters([booleanParam(defaultValue: false, description: 'tickmark to include init step', name: 'includeInit'), choice(choices: ['apply', 'destroy'], description: 'select apply or destroy which to include', name: 'applyORdestroy')])])

pipeline{
    agent any
    tools {
        terraform 'terraform'
    }  



    stages{
        stage("Git Checkout"){
            steps{
                git credentialsId: '8942ffb9-e9f9-466b-93e8-721aea97d5f3', url: 'https://github.com/SharjeeLZeon/jenkinsterraform.git'
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