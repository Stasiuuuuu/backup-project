pipeline {
     agent any
     stages {
          stage ('Test') {
               steps{
               sh 'make test'          
             }
           }
           stage ('Backup'){
                  steps{
                   sh 'make backup FILE=scripts/test.txt'                
                 }
              }
       }

}
