pipeline {
  agent any
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
    string(name: 'ServerUserName', defaultValue: 'serveruser', description: 'Server User Name Eg serveruser')
    string(name: 'ServerUserPwd', defaultValue: 'serverpwd', description: 'Server User Password Eg serverpwd')
    string(name: 'AppServerUserName', defaultValue: 'appServeruser', description: 'App Server User Name Eg appserveruser')
    string(name: 'AppServerUserPwd', defaultValue: 'appServerpwd', description: 'App Server User Password Eg appserverpwd')
  }
  stages {
    stage('Print pipeline parameters') {
      steps {
        script {
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
        bat 'ExecuteImplScripts.bat "action=executeScripts" targetEnv="${targetEnv}" buildName="${BuildNum}" DBUserName="${DBUserName}" DBUserPwd="${DBUserPwd}" DBServerName="${DBServerName}"'
      }
    }
    stage('Stop Server') {
      steps {
        bat 'actionWrapper.bat "action=stopServer" targetEnv="${params.targetEnv}" buildName="${params.BuildNum}" serverUserName="${params.ServerUserName}" serverPassword="${params.ServerUserPwd}" canRestartServer="${params.CanRestartServer}"'
      }
    }
    stage('Start Server') {
      steps {
        bat 'actionWrapper.bat "action=startServer" targetEnv="${params.targetEnv}" buildName="${params.BuildNum}" serverUserName="${params.ServerUserName}" serverPassword="${params.ServerUserPwd}" canRestartServer="${params.CanRestartServer}"'
      }
    }
    stage('Deploy App') {
      steps {
        bat 'actionWrapper.bat "action=deployApp" targetEnv="${params.targetEnv}" buildName="${params.BuildNum}" appServerUserName="${params.AppServerUserName}" appServerUserPwd="${params.AppServerUserPwd}"'
      }
    }
  }
}
