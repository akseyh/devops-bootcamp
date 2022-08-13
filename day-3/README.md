# DevOps Bootcamp Day#3

## Otomasyon
- **Otomasyon**
  - İşleri otomatikleştirmek
- **Orkestrasyon**
  - Birden fazla sunucuda aynı anda otomasyon
  - Kubernetes
- Config Management
- Inventory Management
- Iterative Management
- Continuous Integration
- Continuous Deployment
- Continuous Delivery
- Continuous Development
- Infrastructure as Code

---

## Jenkins

### Jenkins Ortamı Oluşturma
1. docker kurulumu
```bash
sudo apt install docker.io docker-compose -y
```

2. jenkins için ortamı hazırlamak
```bash
docker network create cicd
docker run -d -v jenkins_home:/var/jenkins_home -p 8080:8080 -p 50000:50000 --network cicd --name jenkins jenkins/jenkins:lts
```

3. Biz sunucuya girmeden sunucuya sızmaya çalışan biri giremesin diye initial password oluşturuyoruz.
```bash
docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

4. Ayağa kaldırıyoruz
```bash
docker run -d --name demoserver --network cicd guray/weaksshd:0.2
```

---

### Jenkins SSH Demo Credentials
**hostname**: demoserver
**username**: sshuser
**password**: myweakpassword

serverAliveInterval
clientAliveInterval

---

### Jenkins Build

#### Details
- **parameters**: Buildlere parametreler ekleyebiliriz
- **throttle builds**: Ard arda çalıştırmayı engelleme
- **disable**: Kullanılmaması için disabled edebiliriz
- **concurrent build**: Eş zamanlı build çalıştırma

#### Triggers
Buildleri manuel olarak çalıştırabildiğimiz gibi farklı yöntemlerle de çalıştırabiliriz.
Belirlenen bir görevin sonunda, bir hata sonucunda, github üzerinden veya periyodik olarak da çalıştırabiliyoruz.

**cron ile periyodik trigger örneği:**
MINUTE HOUR DAY_OF_MONTH MONTH DAY_OF_WEEK
> Her sene 6.ayın 5'inde 3:50'de çalıştır
> *: haftanın her günü

```
TZ=Europe/Istanbul
50 3 5 6 *
```

**Pre-build Script**
Build çalışmadan önce script çalıştırır.

**Post-build Script**
Build sonrası script çalıştırır.

**Soru**
Build çalışmadan önce /etc altındaki dosyaları .tar.gz formatında kopyalayıp `backup_etc_{gün}_{ay}_{yıl}.tar.gz` adıyla kaydeden script'i yazın.
`tar czf backup_etc_$(date '+%d_%m_%Y_%H_%M').tar.gz /etc`

⚠️ Bu komut kullanıcının dosyalarda yetkisi yoksa permission denied hatası verebilir.

Bu hata sonucu scriptin patlamaması için komutu aşağıdaki şekilde düzenleyebiliriz.
`tar czf backup_etc_$(date '+%d_%m_%Y_%H_%M').tar.gz /etc || echo ''`
veya
`tar czf backup_etc_$(date '+%d_%m_%Y_%H_%M').tar.gz /etc || /bin/true`

---

### Pipeline
Build versiyonlama problemi ve kopyalama zorluğu sebebiyle bu işleri kod ile yapma gereksinimi yüzünden kullanılır.

> Pipeline script groovy diline benzer bir yapıdadır.

**declarative pipeline**
- pipeline ile başlar
- Daha modern kabul edilir
- Belli başlı komutları çalıştırır

**scripted pipeline**
- node ile başlar
- groovy programlama dili ile kod yazabiliyoruz

---

### Jenkins Lifecycle
1. **Build**
Kod build edilir.
2. **Statik Kod Analizi**
Belli araçlar ile kodun içerisindeki güvenlik açıklarını, performans iyileştirme önerilerini vs bulur.
3. **Unit Test**
Kodun parçalarının kod ile test edilmesi. Bir kod parçasını test etmek için kullanılır.
4. **Packaging**
Kod paketlenerek çalışır hale getirilir.
5. **Functional Test**
Paket mockup servisler ile test edilir. Gerçek bir servise veya database'e istek atmıyoruz. İdeal şekilde ve sınırsız hızlı response dönen mockuplar ile test yapıyoruz.
1. **Integration Test**
Functional test ile farkı paket gerçek servis ve veritabanları ile test edilir. Gecikmelerle ve hatalarla testin geçip geçmediğine bakılır.
7. **E2E Test**
Selenium ile kullanıcı arayüzü ile test edilir.
8. **Prod**
Kod canlıya alınır.

---

## Notlar
> Unix sistemlerde exit-status 0 başarılı anlamına gelir. 0 dışındaki her şey hatadır.

## Komutlar
- Linux dağıtımı bilgileri
`cat /etc/os-release`

- Docker yetki komutu
`sudo usermod -aG docker $USER`

- Son çalışan komutun status bilgisi
`echo $?`

## Keywords
- **jenkins**
- **figlet**
- **clean workspace plugin**
- **cron**
- **pipeline as code**

## Other Resources
- [crontab.guru](https://crontab.guru/)
- [Selenium Python](https://selenium-python.readthedocs.io/)
- Jenkins için örnek birkaç tutorial:
  - https://www.youtube.com/watch?v=FX322RVNGj4
  - https://www.youtube.com/watch?v=nCKxl7Q_20I
  - https://www.youtube.com/watch?v=MayMkFCkzj4