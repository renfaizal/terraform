![alt text](https://raw.githubusercontent.com/renfaizal/terraform/master/terraform_logo.jpg)

# **Infrastructure as Code**
Infrastructure as Code adalah proses penyediaan IT infrastruktur dimana sistem dibangun dan dikelola melalui kode secara automasi (otomatis), bukan secara manual. Atau bisa disebut juga bahasa kerennya Programmable Infrastructure.

Dengan menggunakan kode dan meng-automasi, proses setting dan konfigurasi baremetal, virtual mesin, cloud computing baik itu instalasi baru, perubahan konfigurasi dapat dilakukan secara cepat, mudah, dan berulang. Di sisi lain juga, ada manfaat lainnya yaitu dokumentasi. Jadi siapapun tahu konfigurasi server, kebutuhan aplikasi server dan sebagainya.

Untuk menerapkan IAC tools/alat yang digunakan adalah Packer (build image), Terraform (build vm dan privisioning instance/vm/server),Ansible,Chef,Puppet & Salt Stack (Configurations Management).

Pada kesempatan ini saya menggunakan Terraform untuk build container di Docker.

## 1. Install Docker pada Windows
Silahkan menginstall docker pada windows juga anda belum memilikinya [Docker for Windows](https://docs.docker.com/docker-for-windows/install/#about-windows-containers).
## 2. Download Terraform untuk Windows
Kemudian download [Terraform for Windows](https://www.terraform.io/downloads.html). Sesuaikan versi bit dengan Sistem Operasi anda.
## 3. Konfigurasi PATH untuk Terraform
Ekstrak hasil download dan letakkan pada direktori yang anda kehendaki. Dalam kasus ini saya meletakkannya di:
```
 c:\terraform
```
Kemudian konfigurasi environment path pada windows anda.
```
 1. Buka Edit the Systems Environment Variables
 2. 
```
## 4. Menjalankan Terraform
### Memastikan docker dan Terraform telah berjalan
### Membuat file konfigurasi Terraform
### Menjalankan file konfigurasi
### Mengakses container
## Command Line
