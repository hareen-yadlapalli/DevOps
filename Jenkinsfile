pipeline {
  agent any
  stages {
    stage('Print pipeline parameters') {
      steps {
        script {
          println "gitURL: ${params.gitURL}"
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
          buildURL="${params.gitURL}/${params.BuildNum}.git"
          println "${buildURL}"
        }

      }
    }
    stage('Checkout from git') {
      steps {
        checkout([$class: 'GitSCM', 
                        branches: [[name: '*/master']], 
                        doGenerateSubmoduleConfigurations: false, 
                        extensions: [[$class: 'RelativeTargetDirectory', 
                            relativeTargetDir: 'BuildDir']], 
                        submoduleCfg: [], 
                        userRemoteConfigs: [[url: "${buildURL}"]]])
      }
    }
    stage('Execute Scripts') {
      steps {
        bat 'ExecuteScripts.bat DBUserName="${params.DBUserName}" DBUserPwd="${params.DBUserPwd}"'
      }
    }
    stage('Deploy app to tomcat') {
      steps {
         bat 'DeployApp.bat' 
      }
    }
    stage('Stop Server') {
      steps {
         bat 'stopServer.bat' 
      }
    }
    stage('Start Server') {
      steps {
         bat 'startServer.bat' 
      }
    }

  }
  parameters {
    string(name: 'gitURL', defaultValue: 'gitURL', description: 'git Repo URL')
    string(name: 'BuildNum', defaultValue: 'BuildNum', description: 'Build Number Eg Release1')
    booleanParam(name: 'CanRestartServer', defaultValue: 'false', description: 'Is Restart Required')
    choice(name: 'targetEnv', choices: '''DEV
SYS
UAT
PERF
PROD''', description: 'Target Environment')
    string(name: 'DBServerName', defaultValue: 'localhost', description: 'Database Server Name Eg mydesktop')
    string(name: 'DBUserName', defaultValue: 'demouser', description: 'Database User Name Eg demouser')
    string(name: 'DBUserPwd', defaultValue: 'demopwd', description: 'Database User Password Eg demopwd')
    string(name: 'ImplScriptsLoc', defaultValue: 'ImplScriptsLoc', description: 'Implementation Scritps Location')
    string(name: 'ImplScripts', defaultValue: 'sqlfile1.sql', description: 'Implementation Scripts Eg sqlfile1.sql')
    string(name: 'RBScriptsLoc', defaultValue: 'RBScriptsLoc', description: 'Rollback Scripts Location')
    string(name: 'RBScripts', defaultValue: 'sqlfile1.sql', description: 'Rollback Scripts Eg sqlfile1.sql')
  }
}
