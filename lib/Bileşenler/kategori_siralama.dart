import 'package:f_market/pages/urun_listeleri.dart';
import 'package:flutter/material.dart';
import 'package:f_market/pages/kategorilere_gore_urun.dart';
import 'package:provider/provider.dart';
class yatayKategoriListe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<urunlerrr>(context,listen: false);
    final pdts = productData.items;
    return Container(
      height:95,
      child: ListView(
        scrollDirection: Axis.horizontal, //yatay olmasını sağladık.
        children: <Widget>[
          Kategori(ikon:Icon(Icons.sports_soccer,size: 70,color: Colors.blue,),baslik: 'Spor',function: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>kategoriUrun(
            baslik:'SPOR KATEGORİSİ',
            urun_adi1: pdts[0].urun_isim,
            urun_fiyat1: pdts[0].yenifiyat,
            urun_resmi1: pdts[0].urunResim,
            urun_adi2: pdts[1].urun_isim,
            urun_fiyat2:pdts[1].yenifiyat,
            urun_resmi2:pdts[1].urunResim,
          )));
          },),
          Kategori(ikon:Icon(Icons.laptop,size: 70,color: Colors.cyanAccent),baslik: 'Elektronik',function: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>kategoriUrun(
              baslik:'ELEKTRONİK KATEGORİSİ',
              urun_adi1: pdts[2].urun_isim,
              urun_fiyat1: pdts[2].yenifiyat,
              urun_resmi1: pdts[2].urunResim,
              urun_adi2: pdts[3].urun_isim,
              urun_fiyat2:pdts[3].yenifiyat,
              urun_resmi2:pdts[3].urunResim,
            )));
          },),
          Kategori(ikon:Icon(Icons.soap,size: 70,color: Colors.deepPurple),baslik: 'Kozmetik',function: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>kategoriUrun(
              baslik:'KOZMETİK KATEGORİSİ',
              urun_adi1: pdts[4].urun_isim,
              urun_fiyat1: pdts[4].yenifiyat,
              urun_resmi1: pdts[4].urunResim,
              urun_adi2: pdts[5].urun_isim,
              urun_fiyat2:pdts[5].yenifiyat,
              urun_resmi2:pdts[5].urunResim,
            )));
          },),
          Kategori(ikon:Icon(Icons.checkroom,size: 70,color: Colors.teal),baslik: 'Giyim',function: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>kategoriUrun(
              baslik:'GİYİM KATEGORİSİ',
              urun_adi1: pdts[6].urun_isim,
              urun_fiyat1: pdts[6].yenifiyat,
              urun_resmi1: pdts[6].urunResim,
              urun_adi2: pdts[7].urun_isim,
              urun_fiyat2:pdts[7].yenifiyat,
              urun_resmi2:pdts[7].urunResim,
            )));
          },),
          Kategori(ikon:Icon(Icons.kitchen,size: 70,color: Colors.blueGrey),baslik: 'Beyaz Eşya',function: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>kategoriUrun(
              baslik:'BEYAZ EŞYA KATEGORİSİ',
              urun_adi1: pdts[8].urun_isim,
              urun_fiyat1: pdts[8].yenifiyat,
              urun_resmi1: pdts[8].urunResim,
              urun_adi2: pdts[9].urun_isim,
              urun_fiyat2:pdts[9].yenifiyat,
              urun_resmi2:pdts[9].urunResim,
            )));
          },),
          Kategori(ikon:Icon(Icons.weekend,size: 70,color: Colors.pink),baslik: 'Mobilya',function: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>kategoriUrun(
              baslik:'MOBİLYA KATEGORİSİ',
              urun_adi1: pdts[10].urun_isim,
              urun_fiyat1: pdts[10].yenifiyat,
              urun_resmi1: pdts[10].urunResim,
              urun_adi2: pdts[11].urun_isim,
              urun_fiyat2:pdts[11].yenifiyat,
              urun_resmi2:pdts[11].urunResim,
            )));
          },),

        ],
      ),
    );
  }
}

class Kategori extends StatelessWidget {  //Her kategoriyi yukarıya tek tek yazmamak için class oluşturduk ve nesneleri çağırdık.
  final Icon ikon;
  final String baslik;
  final Function function;

  Kategori({this.ikon, this.baslik, this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap:function,
          child: Container(
            width: 110.0,
            child: ListTile(
              title: ikon,
              subtitle: Text(baslik,style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
            ),
          ),
    ),);
  }
}

