pipeline {
  agent any
  stages {
    stage('First Stage') {
      steps {
        script {
          println "${params.DBUser}"
        }
      }
    }
  }
  parameters {
        string(name: 'BuildNum', defaultValue: 'BuildNum', description: 'Build Number Eg Release-153')
        booleanParam(name: 'CanRestartServer', defaultValue: 'false', description: 'Is Restart Required')
        string(name: 'DBServerName', defaultValue: 'localhost', description: 'Database Server Name Eg mydesktop')
        string(name: 'DBUserName', defaultValue: 'demouser', description: 'Database User Name Eg demouser')
        string(name: 'DBUserPwd', defaultValue: 'demopwd', description: 'Database User Password Eg demopwd')
        string(name: 'ImplScriptsLoc', defaultValue: 'ImplScriptsLoc', description: 'Implementation Scritps Location')
        string(name: 'ImplScripts', defaultValue: 'sqlfile1.sql', description: 'Implementation Scripts Eg sqlfile1.sql')
        string(name: 'RBScriptsLoc', defaultValue: 'RBScriptsLoc', description: 'Rollback Scripts Location')
        string(name: 'RBScripts', defaultValue: 'sqlfile1.sql', description: 'Rollback Scripts Eg sqlfile1.sql')
      }
}
