pipeline {
  agent any
  stages {
    stage('Print Pipeline Parameters') {
      steps {
        script {
          println "Build Number: ${params.BuildNum}"
          println "Is Restart Required: ${params.CanRestartServer}"
          println "Target Environment: ${params.targetEnv}"
          println "Database Server Name: ${params.DBServerName}"
          println "Database User Name: ${params.DBUserName}"
          println "Database Password: ${params.DBUserPwd}"
          println "Implementation Scripts Location: ${params.ImplScriptsLoc}"
          println "Implementation Scripts: ${params.ImplScripts}"
          println "Rollback Scripts Location: ${params.RBScriptsLoc}"
          println "Rollback Scripts: ${params.RBScripts}"
        }

      }
    }
  }
  parameters {
    string(name: 'BuildNum', defaultValue: 'BuildNum', description: 'Build Number Eg Release-153')
    booleanParam(name: 'CanRestartServer', defaultValue: 'false', description: 'Is Restart Required')
    choice(name: 'targetEnv',
        choices: "DEV\nSYS\nUAT\nPERF\nPROD",
        description: 'Target Environment' )
    
    string(name: 'DBServerName', defaultValue: 'localhost', description: 'Database Server Name Eg mydesktop')
    string(name: 'DBUserName', defaultValue: 'demouser', description: 'Database User Name Eg demouser')
    string(name: 'DBUserPwd', defaultValue: 'demopwd', description: 'Database User Password Eg demopwd')
    string(name: 'ImplScriptsLoc', defaultValue: 'ImplScriptsLoc', description: 'Implementation Scritps Location')
    string(name: 'ImplScripts', defaultValue: 'sqlfile1.sql', description: 'Implementation Scripts Eg sqlfile1.sql')
    string(name: 'RBScriptsLoc', defaultValue: 'RBScriptsLoc', description: 'Rollback Scripts Location')
    string(name: 'RBScripts', defaultValue: 'sqlfile1.sql', description: 'Rollback Scripts Eg sqlfile1.sql')
    
  }
}
