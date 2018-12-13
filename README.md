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
 2. Buka Environment Variables
 3. Pada System Variables, tambahkan direktori terraform ke dalam Path dan jangan lupa menambahkan tanda semicolon ;
 4. Klik OK
```
## 4. Menjalankan Terraform

#### Memastikan docker dan Terraform telah berjalan
Untuk mengecek apakah Terraform dan Docker telah berjalan dapat digunakan perintah
```
docker version
```
```
Client:
 Version:           18.06.1-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        e68fc7a
 Built:             Tue Aug 21 17:21:34 2018
 OS/Arch:           windows/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.1-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.3
  Git commit:       e68fc7a
  Built:            Tue Aug 21 17:29:02 2018
  OS/Arch:          linux/amd64
  Experimental:     false
```
```
terraform version
```
```C:\terraform\lamp>terraform version
Terraform v0.11.10
+ provider.docker v1.1.0
```
Untuk menjalankan Terraform digunakan perintah:
```
terraform init
```

#### Membuat file konfigurasi Terraform
```
# Configure Docker provider and connect to the local Docker socket
provider "docker" {
  host = "tcp://localhost:2375/"
}

# Create an Nginx container
resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
  name  = "nginx_server"
  ports {
    internal = 80
    external = 9090
  }
}
resource "docker_image" "nginx" {
  name = "nginx:alpine"
}
# Create a php-fpm container
resource "docker_container" "php" {
  image = "${docker_image.php-fpm.latest}"
  name  = "php_fpm"
}
resource "docker_image" "php-fpm" {
  name = "php:fpm-alpine"
}
```
#### Menjalankan file konfigurasi
Untuk menjalankan perintah ```apply```, pastika bahwa anda sudah berada dalam satu direktori dengan file konfigurasi yang tadi anda buat.
```
terraform apply
```
#### Mengecek kontainer
```
docker ps
```

![Docker Container](https://raw.githubusercontent.com/renfaizal/terraform/master/docker%20container.jpg)

#### Mengakses container
Untuk melihat apakah server yang kita bangun pada container dapat berjalan atau tidak, dapat kita gunakan perintah ```curl localhost:9090```
Jika muncul output seperti dibawah ini, maka nginx sudah berjalan
```
C:\terraform\lamp>curl localhost:9090
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
Atau dapat juga dilakukan dengan mengaksesnya melalui web browser menggunakan url http://localhost:9090
### Command Line


Beberapa Command Line yang dapat dijalankan pada Terraform diantaranya:
#####  ```apply```
Digunakan untuk mengaplikasikan atau menerapkan file konfigurasi Terraform menjadi sebuah infrastruktur seperti yang sudah didefinisikan di dalam file konfigurasi.
##### ```show```
Digunakan untuk menampilkan state dari infrastruktur yang kita deploy, akan menampilkan output konfigurasi yang berjalan saat ini pada infrastruktur yang kita buat.
##### ```validate```
Digunakan untuk melakukan validasi terhadap file konfigurasi yang kita buat
##### ```destroy```
Digunakan untuk menghancurkan atau mematikan infrastruktur yang dimanage oleh Terraform. Ketika perinta ini dijalankan, maka conatiner yang tadi kita deploy menggunakan Terraform akan dimatikan dan diremove.
##### ```refresh```
Digunakan untuk melakukan refresh terhadap file konfigurasi lokal berdasarkan infrastruktur yang berjalan secara real. Penggunaan perintah ini tidak akan membuat infrastruktur yang kita buat berubah, namun akan mengubah file konfigurasi Terraform yang ada.
#### ```plan```
Digunakan untuk melakukan generate dan kemudian menampilkan plan yang akan dijalankan.

**_Kita harus berada dalam satu direktori dengan file konfigurasi ketika menjalankan command line Terraform_**



