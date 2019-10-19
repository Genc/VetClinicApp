# VetApp

**VetApp** veterinerlik işlemleri için geliştirilmiştir. Sisteme üye olabilir ve daha sonrasında giriş yapabilirsin. Rol tabanlı bir yapısı bulunmaktadır. **Sahip olunan yetkiye** göre hayvan sahibi veya hayvan *ekleyebilir, güncelleyebilir, silebilirsiniz*. Hayvan veya hayvan sahibi isim bilgisi girilerek aranabilir ve ilgili kayıtlar bulunması halinde incelenebilir.

##  Sistemdeki Modeller Arasındaki İlişki (Entity Relationship)

![desc](https://farukgenc.com/vetapp/diagram.png)

## Sistemdeki Modeller (Entity)

* User
* Role
* Owner
* Pet

Olmak üzere 4 adet modelimiz mevcut. *User ve Role* modelleri arasında **ManyToMany** bir ilişki bulunmaktadır. Çünkü bir kullanıcı birden fazla role sahip olabilir. Owner ve Pet modelleri arasında ise **OneToMany ile ManyToOne** şeklinde çift yönlü bir ilişki bulunmaktadır. Bir hayvan sahibi birden fazla hayvana sahip olabilir. Ancak sistemdeki hayvan yalnızca bir hayvan sahibine ait olabilir.


## Nasıl kullanabilirim ?

JPA/Hibernate ile geliştirilmiş Spring Boot projemizde herhangi bir tablo oluşturmanıza gerek yok. **Yanlızca bir schema oluşturup** veritabanınızın ismini belirledikten sonra "application.properties" dosyasında DataSource kısmının altındaki url adresini belirlemiş olduğunuz schema ismine göre düzenlenmeli (schema ismi app olarak oluşturulduysa  url=jdbc:mysql://localhost:3306/app?serverTimezone=Turkey olmalı buradaki serverTimeZone başka sistemlerde sıkıntı çıkardığı için eklenmiştir) ve username password alanlarını kendi veritabanı bilgilerinize göre girmelisiniz.

Projeyi isterseniz herhangi bir IDE yardımıyla çalıştırabilirsiniz istersenizde consol üzerinden çalıştırabilirsinz. Konsol üzerinden kolayca çalıştırmak için;

Ana klasörde aşağıdaki komutu çalıştırın. Maven yüklü değilse bilgisayarınızda yükleyin.
```
mvn clean install
```
BUILD SUCCESS ifadesinin ardından /target klasörü altında vetapp.war dosyası oluşacak. Bu dizine girip aşağıdaki komutu çalıştırın.
```
java -jar vetapp.war
```

Artık proje ```localhost:8080``` adresinden ulaşılabilir durumda. :tada:

## Kullanılan Teknolojiler

 - HTML, CSS, Bootstrap
 - Javascript
 - JSP & JSTL
 - JPA/Hibernate
 - Spring Boot
 - Spring Security
 - Spring MVC
 - MySQL

### Ek Bilgi

* Proje ilk çalışmaya başladığı anda sisteme kullanıcı adı **admin** şifreside **admin** olmak üzere full yetkiye sahip (ROLE_ADMIN) bir kullanıcı ekleniyor. Ayrıca herhangi bir kullanıcı üye olurken rolü ROLE_USER olarak tanımlanmakta. Eğer bu ayarlar değiştirilmek istenirse admin için configuration/DataLoader sınıfı ve standart kullanıcı için service/UserServiceImpl/save metodu güncellenmelidir.

* Sistemdeki tüm kullanıcıların şifreleri veritabanında tek yönlü algoritma kullanılarak saklanmaktadır. 

* Giriş yapmayan bir kullanıcı sistemde var olan herhangi bir sayfaya erişememekte ve sistem onu otomatik olarak login sayfasına yönlendirmekte. 

* Sistemde hayvan ya da hayvan sahibi silme işlemlerini yalnızca *ROLE_ADMIN* yetkisine sahip kullanıcı yapabilir. Normalde ROLE_USER yetkisine sahip olan kullanıcı silme butonunu görmemeli. Ancak burada ufak bir test amaçlı hayvan bilgileri ve hayvan güncelleme sayfalarında silme butonu görüntülenebilir durumda. Hayvan sahibi bilgilerinin görüntülendiği ve bilgilerinin güncellendiği sayfada ise silme butonu görünmemekte. Bunu dilerseniz bu sayfalar içinde yapabilir silme butonunu son kullanıcıya göstermeyebilirsiniz.

* Logging level *INFO* olarak belirlenmiş, Hibernate SQL sorguları consol haricinde proje dizini altında *vetclinic.log* dosyasına direkt olarak yazdırılmaktadır. Ayrıca *ACTUATOR* servisleri yalnızca ADMIN rolüne sahip kullanıcı tarafından erişebilir şekilde açık durumdadır. Eğer bu durumları değiştirmek isterseniz application.properties dosyasını ve yetki mekanizması içinde configuration paketi altındaki *SecurityConfiguration* sınıfını ona göre düzenlenmeniz gerekmektedir. 

### Test
/src/test/java/com/vetapp/security paketi altında 3 adet test yazılmıştır. Bunlar;
1. Sisteme hiç bir şekilde giriş yapmadan owner kaydını silmeye çalışmak.
2. User rolündeki bir kullanıcı ile owner kaydını silmeye çalışmak.
3. Admin rolündeki bir kullanıcı ile owner kaydını silmeye çalışmak.

İlk durumda *AuthenticationCredentialsNotFoundException* hatası alınması beklenmekte, ikinci durumda ise *AccessDeniedException* hatası, 3. durumda ise herhangi bir hata almadan başarıyla kaydın silinmesi beklenmekte. 3 Testide çalıştırdığımızda başarı ile sonuçlandığını gözlemleyebiliriz.

## Ekran Görüntüleri

![desc](https://farukgenc.com/vetapp/1-index.png)

------------


![desc](https://farukgenc.com/vetapp/2-register.png)


------------


![desc](https://farukgenc.com/vetapp/3-login.png)


------------


![desc](https://farukgenc.com/vetapp/4-dashboard.png)


------------


![desc](https://farukgenc.com/vetapp/5-addOwner.png)


------------


![desc](https://farukgenc.com/vetapp/6-addedOwner.png)


------------


![desc](https://farukgenc.com/vetapp/7-searchOwner.png)


------------


![desc](https://farukgenc.com/vetapp/8-addPet.png)


------------


![desc](https://farukgenc.com/vetapp/9-addedPet.png)



------------


![desc](https://farukgenc.com/vetapp/10-searchPet.png)


------------


![desc](https://farukgenc.com/vetapp/11-userDetails.png)


------------


![desc](https://farukgenc.com/vetapp/12-petDetails.png)


------------


![desc](https://farukgenc.com/vetapp/13-petsAll.png)


------------

#### Teşekkür

Projeyi geliştirken sidebar menü alanı için [bootstrapious](https://bootstrapious.com/p/bootstrap-sidebar "Bootstrap Sidebar") adresindeki eğitimden yararlandım. Ayrıca 403 ve 404 hata sayfaları için [Colorlib 404 v4](https://colorlib.com/wp/free-404-error-page-templates/ "404 Not Found Page") ve  [Mariana'nın](https://codepen.io/marianab/pen/EedpEb "403 Access Denied Page") yapmış oldukları sayfaları kullandım. Hepsine çok teşekkür ederim. :pray:

*Mutlu geliştirmeler* :innocent:
