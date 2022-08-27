# DevOps Bootcamp Day#7

## Komutlar

### Kubectl ile container yayına almak

1. k3s kurulumu
```bash
curl -sfL https://get.k3s.io | sh -
```

2. nginx container'ı ile deployment oluşturma
```bash
kubectl create deployment anasayfa --image nginx
```

3. Ölçeklendirme
```bash
kubectl scale deployment anasayfa --replicas=3
```

4. Containerı load balancer ile dış dünyaya açmak
```bash
kubectl expose deployment anasayfa --port 80 --type NodePort
```

5. Servisleri görüntüle
```bash
kubectl get service
```

---

Servisleri görüntüle
```bash
kubectl get service
```

Podları görüntüle
```bash
kubectl get pod
```

> **Pod İsimlendirme**
> [UYGULAMA_ADI]-[REPLICA_SET_ADI]-[POD_ADI]

Makineleri görüntüle
```bash
kubectl get node
```

yaml çıktı almak
```bash
kubectl get node -o yaml
```

explain
```bash
kubectl explain node
```

describe
```bash
kubectl describe node bootcamp
```

Cluster Info
```bash
kubectl cluster-info
```

Kubectl ile ping atan bir pod ayağa kaldırmak
```bash
kubectl run pingpong --image alpine ping 127.0.0.1
```

Pod loglarını yazdırmak
```bash
kubectl logs pingpong --tail 1 -f
```

Bulunduğun namespacedeki service, deployment, replicaSet ve podları görüntüle
```bash
kubectl get all
```

Pod label değiştirme
> * Label sonuna - koyarsak labelı siler.
> * Selector, app ve pod-template-hash labellarına göre filtreleme yapar.

```bash
kubectl label pod pingpong-5c5fddf95d-v4nwc pod-template-hash-
```

```bash
kubectl label pod pingpong-5c5fddf95d-v4nwc team=backend
```


## Notlar
* Kubernetes ve kubectl çoğu zaman REST API üzerinden haberleşiyor.
* DevOps görevlerinden biri kubernetes versiyonunu kontrol etmek.
* Kubernetes versiyonu 1.15 ise kubectl versiyonu 1.14.Y veya 1.16.Y olabilir.
* Kubeconfig directory: `~/.kube/config`
* `export KUBECONFIG=/etc/rancher/k3s/k3s.yaml`
* Kubernetes containerların kullanabileceği kaynak limtilerini belirleyebiliriz.
* Podlar ölçeklenemez.
* **Deployment** -> **ReplicaSet** -> **Pod**

## Keywords
* **Docker Swarm**
* **Kubectl**
* [semantic versioning](https://semver.org/)
* **OpenShift** - **OKD**
* **RKE** / **RKE2 (Rancher Kubernetes Engine)**
* **GKE (Google Kubernetes Engine )**
* **EKS (Elastic Kubernetes Service)**
* **AKS (Azure Kubernetes Service)**
* [k3s](https://k3s.io/)
* **rolling release**, **rollout** / **rollback**
* **OOM (Out of Memory)**
* **OOMkiller**
* **Batch jobs**
* **etcd (key-value db)**
* [fork bomb](https://www.cyberciti.biz/faq/understanding-bash-fork-bomb/)

## Other Resources
* [Introduction to Kubernetes](https://container.training/kube-selfpaced.yml.html)
* [DockerCoins](https://github.com/jpetazzo/container.training/tree/main/dockercoins)
* [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
* [Install Kubernetes](https://kubernetes.io/docs/tasks/tools/)
* [Kubectl Permissions](https://rancher.com/docs/k3s/latest/en/installation/install-options/how-to-flags/)