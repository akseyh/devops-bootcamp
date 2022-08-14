# DevOps Bootcamp Day#4

## Pipeline Script

**agent**
Buildi ana node ile çalıştırmak yerine alt agentlar oluşturarak bunlarda çalıştırıyoruz. Agentlara bazı labellar vererek belli labela sahip olan agent ile çalıştırmak gibi seçenekler var.
```groovy
agent {
  label 'linux'
}
```

**environment**
Global olarak veya stage içerisinde environment tanımlaması yapılabilir.
```groovy
pipeline {
    agent any
    
    environment {
        GLOBAL_ENVIRONMENT="PROD"
    }

    stages {
        stage('Yedekle') {
            environment {
                STAGE_ENVIRONMENT="TEST"
            }
            steps {
                echo 'Stage 1:'
                sh 'echo GLOBAL_ENVIRONMENT: $GLOBAL_ENVIRONMENT' // PROD
                sh 'echo STAGE_ENVIRONMENT: $STAGE_ENVIRONMENT' // TEST
            }
        }
        stage('Guncelle') {
            steps {
                echo 'Stage 2:'
                sh 'echo GLOBAL_ENVIRONMENT: $GLOBAL_ENVIRONMENT' // PROD
                sh 'echo STAGE_ENVIRONMENT: $STAGE_ENVIRONMENT' // !!NOT ACCESSIBLE!!
            }
        }
    }
}
```
> **sh komutunda tek tırnak ve çift tırnak kullanımı farkı:**
> Tek tırnak shell'e yorumlaması için direk değişkeni gönderiyor.
> Çift tırnak value değerini bularak onu gönderiyor.
> 
> Tek tırnak kullanmak değişkeni görüntülemek ve buildin patlamaması için daha kullanışlı.

**input**
Stagelerde kullanıcıdan input almak için kullanılır
```groovy
input {
  message 'Devam edilsin mi?'
  ok 'Evet'
}
```

**matrix**
Matris şeklinde çok sayıda işlemi tanımlamak için kullanılır
```groovy
matrix {
  axes {
    axis {
      name 'PLATFORM'
      values 'linux', 'mac', 'windows'
    }
    axis {
      name 'BROWSER'
      values 'chrome', 'firefox', 'opera'
    }
  }
}
```

Daha fazla bilgi için: [Snippet Generator](https://opensource.triology.de/jenkins/pipeline-syntax/)


## Komutlar

### Jenkins Docker Kurulumu
Docker içerisinde jenkinsin kullanacağı bir docker oluşturur.
```bash
docker run --name jenkins-docker --rm --detach \
  --privileged --network cicd --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind --storage-driver overlay2
```

```bash
docker run --name jenkins-blueocean --restart=on-failure --detach   --network cicd --env DOCKER_HOST=tcp://docker:2376   --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1   --publish 8080:8080 --publish 50000:50000   --volume jenkins-data:/var/jenkins_home   --volume jenkins-docker-certs:/certs/client:ro   jenkins/jenkins:2.346.3-jdk11
```

**initial password**
```bash
docker exec -it $(docker ps -lq) cat /var/jenkins_home/secrets/initialAdminPassword
```

## Notlar
> node ayarlarından number of executors yani node'un aynı anda execute edeceği build sayısını değiştirebiliriz.
> 

## Keywords
- **Jenkins agents**
- [Snippet Generator](https://opensource.triology.de/jenkins/pipeline-syntax/)
- **blueocean (plugin)**
- **gitea**
- **ci/cd/cdp**
- **telepresence**