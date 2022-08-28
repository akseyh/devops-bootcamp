# DevOps Bootcamp Day#8

## Kubernetes Networking

### Servis tipleri
**ClusterIP**: Sadece içeriden erişilen bir IP adresi kullanılır.

**NodePort**: ClusterIP açar ve her makinede sabit olan bir port seçer ve dinler, hangisine istek gelirse gelsin isteği ilgili porta gönderir.

**Load Balancer**: Cloud load balancer açar istenen portu dinleyerek içerideki portlara yönlendirir.

## Jobs
* **Batch Jobs**: Tek seferlik çalışır.
* **Cron Jobs**: Zaman ayarlı batch job çalıştırır.

## Komutlar
Tüm contextleri göster
`kubectl config get-context`

Aktif contexti göster
`kubectl config current-context`

Dry Run
`kubectl apply --dry-run=server -f ...`

`--dry-run=server`: Server ile yaml kıyaslaması yapar. Bir değişiklik yapmaz.

## Notlar
* `kubectl logs` default olarak maksimum 5 request sınırı vardır. `--max-log-requests` parametresi ile override edilebilir.
* Ingress layer 7'de çalışır. Gelen trafiği gerekli yerlere yönlendirir. Servis listesinde gelmez. `kubectl get ingress` ile listenebilir.

## Keywords
* **declarative vs imperative**
* **gcp anthos**
* **gcp service accounts**
* **k3d**
* **KinD (kubernetes in docker)**
* **MicroK8s**
* **Minikube**
* **DaemonSets**
* **Healtchecks**
* **Stateful Set**
* **helm**: The package manager for Kubernetes

## Other Resources
* [GCE Terraform Tutorials](https://learn.hashicorp.com/tutorials/terraform/gke)
* [learn-terraform-provision-gke-cluster](https://github.com/hashicorp/learn-terraform-provision-gke-cluster/blob/main/vpc.tf)
* [k8slens](https://k8slens.dev)
* [YT: Ahmet Alp Balkan](https://www.youtube.com/c/ahmetb)
* [roadmap.sh](https://roadmap.sh/devops)
* [Amazon Up And Running](https://www.oreilly.com/library/view/kubernetes-up-and/9781098110192/)
* [The Book Of Kubernetes](https://www.oreilly.com/library/view/the-book-of/9781098141394/)
* [Kubernetes in Action](https://www.oreilly.com/library/view/kubernetes-in-action/9781617293726/)
* [UNIX and Linux System Administration Handbook](https://www.amazon.com/UNIX-Linux-System-Administration-Handbook/dp/0131480057)