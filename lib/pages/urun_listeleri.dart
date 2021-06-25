import 'package:flutter/material.dart';

class urunn with ChangeNotifier{
  final String id;
  final String urun_isim;
  final String aciklama;
  final double eskifiyat;
  final double yenifiyat;
  final String urunResim;

  urunn(
      {@required this.id,
      @required this.urun_isim,
      @required this.aciklama,
      @required this.eskifiyat,
      @required this.yenifiyat,
      @required this.urunResim});
}

class urunlerrr with ChangeNotifier{
  List<urunn> _items = [
    urunn(
        id: "1",
        urun_isim: "Basketbol Topu",
        aciklama:
            "7 numara basketbol topu, dış mekanlarda  basketbol oynayan yetişkinler için tasarlanmıştır.. Bu basketbol topu 12 yaş üzeri çocuklar ve erkekler için resmi olan 7 numara boya sahiptir. Kauçuk süngerden oluştuğundan dolayı top tutuşun yanında dayanıklılık da sağlar.",
        eskifiyat: 80,
        yenifiyat: 60,
        urunResim: "assets/images/basketball.png"),
    urunn(
        id: "2",
        urun_isim: "Futbol Topu",
        aciklama:
            "12 yaş ve üzeri kullanıma uygundur.Okullar , spor okulları ve antrenmanlar için uygun futbol topudur.",
        eskifiyat: 90,
        yenifiyat: 65,
        urunResim: "assets/images/football.png"),
    urunn(
        id: "3",
        urun_isim: "Monitör",
        aciklama:
            "Oyun oynarken daha iyi görüntü ve performans için doğru adrestesiniz!",
        eskifiyat: 1450,
        yenifiyat: 1005,
        urunResim: "assets/images/mon.png"),
    urunn(
        id: "4",
        urun_isim: "Bilgisayar Kasası",
        aciklama:
            "Oyunlarda daha akıcı oynamak,daha iyi performans almak ve diğer oyuncuların önüne geçmek için yeni nesil oyuncu kasası",
        eskifiyat: 500,
        yenifiyat: 450,
        urunResim: "assets/images/computercase.png"),
    urunn(
        id: "5",
        urun_isim: "Cilt Bakım Seti",
        aciklama:
            " Cildinizi temizler ve görünür lekelerle mücadele eder.Yoğun nem sağlar ve cildinizin taze kalmasını sağlar. Şaşırtıcı derecede güzel bir cilt için deneyin!",
        eskifiyat: 44,
        yenifiyat: 26,
        urunResim: "assets/images/skincare.png"),
    urunn(
        id: "6",
        urun_isim: "Şampuan",
        aciklama:
            "Besleyici,Koruyucu,Nemlendirici, Onarıcı,  Kepek Önleyici, Dökülme Karşıtı Şampuan",
        eskifiyat: 50,
        yenifiyat: 34,
        urunResim: "assets/images/shampoo.png"),
    urunn(
        id: "7",
        urun_isim: "Pantolon",
        aciklama:
            "Belden Düşmemesi ve Sağlam Diz Bölgesiyle; Çalışanlar ve Gün İçerisinde Rahat Hareket Etmek İsteyenler için İdeal.",
        eskifiyat: 143,
        yenifiyat: 95,
        urunResim: "assets/images/trousers.png"),
    urunn(
        id: "8",
        urun_isim: "Ceket",
        aciklama:
            "Ürün içerisinde bulunan etikete uygun yıkama yapılmalıdır. Ürün boyu: 75cm - Kol boyu: 63cm",
        eskifiyat: 200,
        yenifiyat: 160,
        urunResim: "assets/images/jackett.png"),
    urunn(
        id: "9",
        urun_isim: "Buzdolabı",
        aciklama:
            "A+ enerji sınıfı ile A enerji sınıfı buzdolaplarına  daha az enerji harcar.Meyve ve sebzeleriniz daima taze kalır.Dondurulmuş gıdaları çözülmeye karşı korur.",
        eskifiyat: 4280,
        yenifiyat: 3750,
        urunResim: "assets/images/refrigerator.png"),
    urunn(
        id: "10",
        urun_isim: "Çamaşır Makinesi",
        aciklama:
            "Ürünümüz en yüksek verimlilik sağlayan A+++ enerji sınıfına göre %30 daha fazla enerjiden tasarruf edilmesini sağlıyor.Ürün birçok farklı yıkama programı seçenekleri ile başarılı bir yıkama işlemi gerçekleştiriyor.",
        eskifiyat: 2300,
        yenifiyat: 1675,
        urunResim: "assets/images/washing machine.png"),
    urunn(
        id: "11",
        urun_isim: "Koltuk Takımı",
        aciklama:
            "Tarzına asil bir zerafet katan kumaşıyla sıradanlığın dışına çıkın.",
        eskifiyat: 2650,
        yenifiyat: 2200,
        urunResim: "assets/images/sofaset.png"),
    urunn(
        id: "12",
        urun_isim: "Oyuncu Koltuğu",
        aciklama:
            "Bilgisayar başında otururken daha rahat bir şekilde oturmak istiyorsunuz? O zaman doğru adrestesiniz.",
        eskifiyat: 1000,
        yenifiyat: 900,
        urunResim: "assets/images/oyuncukoltugu.png"),
  ];
  List<urunn> get items{
    return [..._items];
  }
  urunn idIleBul(String id){
    return _items.firstWhere((pdt) => pdt.id==id);
  }
}
