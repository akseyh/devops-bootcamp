# DevOps Bootcamp Day#5

## Docker Kurulumu
`apt install docker.io`
veya
`curl -sSL https://get.docker.com | bash`

---

## Notlar
* Docker, container açmayı ve kapatmayı ve yönetmeyi sağlayan bir araçtır. 
* Container açmak sistemde yetki gerektiren bir işlem.
* Komut satırından docker komutu girmek yerine örneğin Python ile Docker API'a istek atılarak kullanılabilir.
* Sistem paket veritabanı dizini: `/etc/apt/sources.list.d`
* `SIGINT`: uygulamaya kapanmanı istiyorum sinyali gönderir.
* `SIGKILL`: uygulamanın fişini çeker.

---

## Komutlar
Docker Client/Server Info
`docker info`

---

Docker ile nginx ayağa kaldırma
`docker run -it nginx`

---

Kullanıcıya docker yetkisi vermek
`usermod -aG docker ubuntu`
> Bu komut ile kullanıcı root yetkilerine sahip olmadan root komutlarına erişebilir.

---

Docker başlatmak
`systemctl start docker`

---

Sistem açıldığında docker açılması için
`systemctl enable docker`

---

Docker busybox çalıştır
`docker run busybox echo hello world`

---

Çalıştırılan imajın komut satırına erişmek 
`docker run -it ubuntu`
`-i`: klavyede basılan tuşları container'a iletiyor.
`-t`: komut satırı ekranını sağlıyor.

---

Şuan çalışan containerları listeleme
`docker ps`
`-a`: çalışan ve çalışmayan containerları listeleme
`-q`: sadece idleri döndürür
`-l`: last

---

Container'ı arkaplanda çalıştırma
`docker run -d jpetazzo/clock`
`-d`: detached

---

Docker loglarını canlı takip etme
`docker logs -f kind_blackwell`
`docker logs --tail 3 kind_blackwell`: Son 3 satırı listeler

---

Docker stop komutu
Containerın kapanması için 10sn bekler (SIGINT). Hala çalışmaya devam ediyorsa fişini çeker (SIGKILL).

---

Docker kill komutu
Containerın fişini çeker (SIGKILL).

---

`-it` ile çalıştırdığımız container'ın komut satırından ayrılmak
Detach: `Ctrl + P` + `Ctrl + Q` 

---

Arkaplandaki containera bağlanmak
Attach: `docker attach {container_id}`

---

## Keywords
* **container**
* **containerd**
* **cri-o**
* **podman**
* **artifact**
* **busybox**
* **Docker Names Generator (Go)**
* **alpine**
* **log to stdout**

---

## Other Resources
* [Docker ve Container Eğitim Serisi](https://www.youtube.com/playlist?list=PLijRwDfUJ_btzGLKV_VdVdHI75Q_X-eQh)
* [Introduction to Containers](https://container.training/intro-selfpaced.yml.html)
* [Cloud Native Landscape](https://l.cncf.io/)
* [Play With Docker](https://labs.play-with-docker.com/)