# DevOps Bootcamp Day#1

## ÖNEMLİ LINUX KOMUTLARI

### Komut satırı başlığı değiştirmek
`export PS1=‘komut: ‘`

### Login olan userları yazdırmak
* w
* who
* lastlog

### Komutları loglama
`script  kayit.log` ile başlatılır `exit` komutu ile sonlandırılır.

### Dosya detayı
`file kayit.log`

### Dosya İçeriği Yazdırmak İçin
* cat
* vim
* nano
* less
* more
* head
* tail -15

### Dizin konumu öğrenme
 `pwd`

### Değişkenler
```bash
echo $PWD
echo $USER
echo $SHELL
```

### grep detaylı kullanımı
`ls --help | grep -- -l`

### word count
-l komutu ile satır sayar
`wc -l`

### make directory
-p: parent
```bash
mkdir -p
```

### Kullanışlı shell komutu
```bash
mkdir -p fotograflar/{ocak,subat,mart}
```
veya
```bash
mkdir -p fotograflar/{1..10}
mkdir -p fotograflar/{a..z}
```

Shell bu komutu aşağıdaki şekilde düzenler.
```bash
mkdir -p fotograflar/ocak fotograflar/subat fotograflar/mart
```

### Dizini iç içe listeleme
`ls -R`
-R: recursive

### stdin & stdout & stderr
**>** (Output forwarding)
Save output to a file.
**>>**
Append output to a file.
**<** (Stdin)
Read input from a file.
**1>** (Stdout)
Redirect output messages.
**2>** (Stderr)
Redirect error messages.
**&>** (Stderr)
Redirect output and error messages.
**|** (Pipe)
Send the output from one program as input to another program.
**stdout**
Ekran da bir app olarak dev (device) dizininde mevcut. Çıktıyı `/dev/stdout`’a yönlendirirsek ekrana yazılacaktır.
```bash
echo 'hello' > /dev/stdout
```
[Learn Piping and Redirection - Linux Tutorial](https://ryanstutorials.net/linuxtutorial/piping.php)

## Vim Komutları
**i**: insert
**v**: visual
**yyp**: alt satıra kopyala

### vim satır numarası açma/kapatma
`set number`
`set number!`

### Sunucuyu yeniden başlatma
`reboot`

### Sunucuyu kapatma
`poweroff`

## Other Resources
* [UNIX and Linux System Administration Handbook : Nemeth, Evi, Snyder, Garth, Hein, Trent R., Whaley, Ben, Mackin, Dan: Amazon.com.tr: Kitap](https://www.amazon.com.tr/UNIX-Linux-System-Administration-Handbook/dp/0134277554)
* [FREE 4 Hour Ubuntu Course for Beginners](https://www.youtube.com/watch?v=t7uvq6z41Ro)
* [Linux Operating System - Crash Course for Beginners](https://www.youtube.com/watch?v=ROjZy1WbCIA&t=2s)
* [The 50 Most Popular Linux & Terminal Commands - Full Course for Beginners](https://www.youtube.com/watch?v=ZtqBQ68cfJc&t=10811s)













