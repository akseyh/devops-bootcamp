# DevOps Bootcamp Day#2

## Uygulamanın sürekli çalışması için kullanılan araçlar
* Screen [How To Use Linux Screen | Linuxize](https://linuxize.com/post/how-to-use-linux-screen/)
* Tmux
* Service / systemd unit
* Docker / container
* Nohup

## Dizin Sistemi
1. **bin (binary)**: sistemdeki temel uygulamalar ls, cd…
2. **boot**: sistem açıldığında çalışacak uygulamalar.
3. **dev** (device): sistemdeki cihazlar.
	* shm (shared memory): Rame yazılır. Kayıt edilmez.
4. **etc**:  ayarlar
	* **passwd**: userlar
	* **shadow**: parolalar şifrelenmiş şekilde tutulur
	* **sudoers**: sudo yetkisi olan kullanıcılar
5. **home**: root harici kullanıcıların ev dizinleri.
6. **root**: root kullanıcısının ev dizini.
7. **lib**
8. **media**, mnt: takılan disklerin bulunduğu klasörler.
9. **snap**: çoğu sistemde yok.
10. **lost+found**: sistem dosyaları taradıktan sonra bulduğu belirsiz dosyaları bu dizine atıyor.#
11. **opt (options)**: uygulama dosyalarının ayarlarını tuttuğu dizin.
12. **tmp**: sistemde geçici dosyaların saklandığı dizin. Herkes dosya koyabilir fakat sadece kendi dosyalarını düzenleyebilir ve silebilir.
13. **var (variables)**: Sistem üzerinde değişebilecek dosyalar. Örneğin sisteme giriş yapan kullanıcılar. 
	* **log**: Sistemdeki çoğu log bu dizinde tutulur.
14. **proc (process)**: Sistemde çalışan uygulamaları tutar. Sanal dosya sistemi, diskte tutulmuyor.
15. **sys**: proc ile benzer.
16. **run**: Şuan çalışan uygulamaları tutar.

## Komutlar
### Çalışan uygulamaları listeleme 
* `ps aux`
* `top`
* `htop`
### systemctl
* **unitleri listele**:
`systemctl list-units`
* **servisleri filtrele**: 
`systemctl list-units | grep ‘.service’`
* **yenile**: Uygulamanın desteklemesi gerekir.
`systemctl reload nginx`
`systemctl restart nginx`
### nginx
* **başlat**: 
`systemctl start nginx`
* **durdur**: 
`systemctl stop nginx`
* **başlangıçta başlat**:
`systemctl enable nginx`
* **başlangıçta başlatmayı durdur**:
`systemctl disable nginx`

### log takip etme
* `tail -f -n 2 /var/log/nginx`

### journalctl
systemctl benzeri log yönetimi için bir çözüm.

### find
`find . -name nginx.conf`
`find . -name '*nginx*' -type d`

### ping
`ping test.com`

### dig
`dig @8.8.8.8 test.com`

### nslookup
Minimal sistemlerde genelde nslookup bulabiliriz.
`nslookup test.com 8.8.8.8`

### curl
`curl test.com`

**-v** (verbose) ile detayları görebiliriz
`curl -v test.com`

### wget
curl ile benzer. Dosya indirmek için hızlı ve kullanışlı.
`wget https://releases.ubuntu.com/22.04/...`

### adduser
`adduser sems`

## Yetkiler
drwxrwxr
- - - -
> İlk harf dosyanın tipini belirtir.

**-** -> regular file
**d** -> dizin
**f** -> dosya
**c** -> character device (fiziksel, sanal cihazlar) (Örn: komut satırı)
**b** -> block device (Örn: harddisk)
- - - -
> **(2,3,4)**. harfler kullanıcının dosya üzerindeki yetkileri  
> **(5,6,7)**. harfler grubun dosya üzerindeki yetkileri  
> **(8,9,10)**. harfler diğer kullanıcıların yetkileri  

**r** -> read
**w** -> write
**x** -> execute

[File Permissions in Linux / Unix: How to Read, Write & Change?](https://www.guru99.com/file-permissions.html#:~:text=Linux%20divides%20the%20file%20permissions,ownership%20of%20a%20file%2Fdirectory.)

### Dosyanın sahibini değiştirmek
> Sadece root dosyanın sahibini değiştirebilir.
```bash
chown guray sozler.txt
```

### Dosya yetkilerini değiştirmek
> 2’lik sisteme göre yazılır.

`chmod 644` -> `-rw-r--r--`

## Sorular
* apt ile bir paketin belli bir versiyonu nasıl yüklenir? 
[How to Install Nginx Latest Version on Ubuntu 20.04, Ubuntu 18.04 - LinuxBabe](https://www.linuxbabe.com/ubuntu/install-nginx-latest-version-ubuntu-18-04)
* Bir paketin bir sürümde sabit kalmasını nasıl sağlarız?

## Keywords
* ssh keepalive [How to Keep Alive SSH Sessions](https://patrickmn.com/aside/how-to-keep-alive-ssh-sessions/)
* ip spoofing