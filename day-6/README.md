# DevOps Bootcamp Day#6

## Dockerfile
**Direktifler (Directives)**
* FROM
* RUN
* CMD
* ENTRYPOINT

---

## Bir imajın boyutunu nasıl düşürürüz?
Dockerfile içerisinde RUN direktifi ile 
`apt install ... && ... && apt remove ...`
şeklinde komutlar görebiliriz. 
Bu komutlar gerekli paketleri indirip işini hallettikten sonra paketleri siler.

---

## Terraform
**Infrastructure as Code**
Terraform gerekli paketleri indirme
`terraform init`

Plan oluşturma
`terraform plan`

Plan uygulama
`terraform apply`

---

## Network Drivers
* bridge (default)
* null (for the special network called none)
* host (for the special network called host) 
* container (that one is a bit magic!)

---

## Notlar
* Dockerfile dosyasında herhangi input bekleyen bir durum olmamalı.
* Docker build yaptığımızda CMD çalışmaz, not olarak eklenir.
* Bir Dockerfile içerisinde iki CMD direktifi olursa sonuncusu geçerli olur.
* ENTRYPOINT ve CMD yan yana çalışır. CMD'e verdiğiniz komutlar ENTRYPOINT'in parametresi olur.
* Containerların kendilerine ait sanal ip adresleri olur.

---

## Komutlar
Containerdan image üretmek
`docker commit {container_id}`

---

Image'a name ve tag eklemek
`docker tag {image_id} sems/new_name:latest`

---

Dockerfile build etmek
`docker build .`

tag ile build etmek
`docker build -t sems/new_name .`

`--no-cache`: cache kullanma

---

Kendi bilgisayarımızdan container'ın içerisine dosya kopyalama
`docker cp main.c {container_id}:/tmp`

---

Çalışan process'e ellemeden container içerisinde komut çalıştırma
`docker exec -it {container_id} /bin/bash`

---

Bulunduğu makinenin network'unu kullanabilen container çalıştırma
`docker run -it --network host alpine`

> Container'ın network izolasyonu olmaz

---

Container'ın detaylarını öğrenmek
`docker inspect {container_id}`

---

Container'ı dış dünyaya yönlendirme
`docker run -d --name web -p 8080:80 nginx`

> web adında nginx image'ı ile container çalıştırır.
> Sunucumuzun ip adresinin 8000 portundan bu container'a erişebiliriz.

---

Volume listeleme
`docker volume ls`

Volume oluşturma
`docker volume create static`

Container çalıştırırken static adındaki volume ile localdeki data dizinini bağlamak
`docker run -it -v static:/data alpine`

`docker run -v $PWD:/usr/share/nginx/html -d --name web -p 80:80 nginx`

---

Container içerisinde ENVIRONMENT değişkenlerini kullanma
`docker run -it --rm -e DB_HOST=localhost alpine`

---

## Keywords
* **Dockerfile**
* **dind (Docker in Docker)**
* **multi-stage build**
* **service discovery**
* **bind mount**

---

## Other Resources
* [Postgres Dockerfile](https://github.com/docker-library/postgres/blob/master/15/alpine/Dockerfile)
* [Terraform](https://www.terraform.io/)
* [Learn HashiCorp](https://learn.hashicorp.com/)