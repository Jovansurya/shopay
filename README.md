# SHOPEE PAY

<br/>

| Metode   | End Point                                            | Dokumentasi | Autentikasi | Deskripsi                                |
|----------|------------------------------------------------------|-------------|-------------|------------------------------------------|
| POST     |/profile               |[Register](#large_blue_circle-register-large_blue_circle)|Tidak|Registrasi akun|
| POST     |/login                  |[Login](#large_blue_circle-login-large_blue_circle)|Tidak|Masuk akun dan mendapatkan token|
| PATCH    |/profile/saldo          |[Top Up](##large_blue_circle-profile-large_blue_circle)|Ya|Melakukan topup|
| GET      |/profile                |[Profil](#large_blue_circle-top-up-large_blue_circle)|Ya|Mendapatkan informasi mengenai akun|
| PATCH    |/profile/pay            |[Transaksi](#large_blue_circle-transaksi-large_blue_circle)|Ya|Melakukan pembayaran atas transaksi pembelian yang telah dilakukan|

<br/>

### Register
- Method: `POST`
- Autentikasi: Tidak
- Parameter: 

Atribute | TipeData | Deskripsi
--- | --- | ---
name | string | Nama sebagai informasi atas identitas pengguna
email | string | Menggunakan format email yang sesuai, dengan ketentuan satu email untuk satu akun
password | string | Password dari pengguna, disarankan menyusun password yang aman dan tidak sederhana
confirmpassword | string | Konfirmasi password dari pengguna, disarankan menyusun password yang aman dan tidak sederhana

Contoh:
`POST` https://diggie.herokuapp.com/profile

![image](/img/register1.png)

Respon:

![image](/img/register2.png)
![image](/img/register3.png)

### Login
- Method: `POST`
- Autentikasi: Tidak
- Parameter: 

Atribute | TipeData | Deskripsi
--- | --- | ---
email | string | Email dari pengguna
password | string | Password dari pengguna

Contoh:

![image](/img/login1.png)

Respon:

![image](/img/login2.png)
![image](/img/login3.png)
![image](/img/login4.png)

### Top Up
- Method: `PATCH`
- Autentikasi: Ya &rarr; Token yang didapat ketika melakukan login, disimpan pada Authorization Bearer
- Parameter: 

Atribute | TipeData | Deskripsi
--- | --- | ---
jumlah | number | Jumlah atau nominal topup yang akan dilakukan oleh pengguna

Contoh:

![image](/img/topup1.png)

Respon:

![image](/img/topup2.png)

### Profil
- Method: `GET`
- Autentikasi: Ya &rarr; Token yang didapat ketika melakukan login, disimpan pada Authorization Bearer
- Parameter: -


Respon:

![image](/img/profil1.png)

### Transaksi 
- Method: `PATCH`

- Autentikasi: Ya &rarr; Token yang didapat ketika melakukan login, disimpan pada Authorization Bearer
- Parameter: 

Atribute | TipeData | Deskripsi
--- | --- | ---
jumlahBayar | number | Nominal harga barang yang ingin dibeli

Contoh:

![image](/img/transaksi1.png)

Respon:

![image](/img/transaksi2.png)