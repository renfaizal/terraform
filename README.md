Infrastructure as Code adalah proses penyediaan IT infrastruktur dimana sistem dibangun dan dikelola melalui kode secara automasi (otomatis), bukan secara manual. Atau bisa disebut juga bahasa kerennya Programmable Infrastructure.

Dengan menggunakan kode dan meng-automasi, proses setting dan konfigurasi baremetal, virtual mesin, cloud computing baik itu instalasi baru, perubahan konfigurasi dapat dilakukan secara cepat, mudah, dan berulang. Di sisi lain juga, ada manfaat lainnya yaitu dokumentasi. Jadi siapapun tahu konfigurasi server, kebutuhan aplikasi server dan sebagainya.

Untuk menerapkan IAC tools/alat yang digunakan adalah Packer (build image), Terraform (build vm dan privisioning instance/vm/server),Ansible,Chef,Puppet & Salt Stack (Configurations Management).

Pada kesempatan ini kita menggunakan Terraform untuk build VM sampai provisioning di OpenStack.
