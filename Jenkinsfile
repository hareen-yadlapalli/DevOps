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
          /*
          println "Implementation Scripts Location: ${params.ImplScriptsLoc}"
          println "Implementation Scripts: ${params.ImplScripts}"
          println "Rollback Scripts Location: ${params.RBScriptsLoc}"
          println "Rollback Scripts: ${params.RBScripts}"
          */
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
        bat 'ExecuteImplScripts.bat DBUserName="${params.DBUserName}" DBUserPwd="${params.DBUserPwd}" DBServerName="${params.DBServerName}"'
      }
    }
    stage('Backup app from tomcat') {
      steps {
        //bat 'DeployApp.bat'
        actionWrapper.bat "targetEnv=${params.targetEnv}" "action=backupApp"
      }
    }
    stage('Deploy app to tomcat') {
      steps {
        //bat 'DeployApp.bat'
        actionWrapper.bat "targetEnv=${params.targetEnv}" "action=deployApp"
      }
    }
    stage('Stop Server') {
      steps {
        actionWrapper.bat "targetEnv=${params.targetEnv}" "action=stopServer"
      }
    }
    stage('Start Server') {
      steps {
        actionWrapper.bat "targetEnv=${params.targetEnv}" "action=startServer"
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
PRD''', description: 'Target Environment')
    string(name: 'DBServerName', defaultValue: 'localhost', description: 'Database Server Name Eg mydesktop')
    string(name: 'DBUserName', defaultValue: 'demouser', description: 'Database User Name Eg demouser')
    string(name: 'DBUserPwd', defaultValue: 'demopwd', description: 'Database User Password Eg demopwd')
  }
}
