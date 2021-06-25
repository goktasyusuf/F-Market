import 'package:flutter/material.dart';
import 'package:f_market/pages/urun_detaylari.dart';
import 'package:provider/provider.dart';
import '../pages/urun_listeleri.dart';

class urunler extends StatefulWidget {
  @override
  _urunlerState createState() => _urunlerState();
}

class _urunlerState extends State<urunler> {

  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<urunlerrr>(context,listen: false);
    final pdts = productData.items;
    return GridView.builder(
      physics: ScrollPhysics(),
      itemCount: pdts.length - 6,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: pdts[i],
          child: urun(
            urun_adi: pdts[i].urun_isim,
            urun_hakkinda: pdts[i].aciklama,
            urun_eski_fiyat: pdts[i].eskifiyat,
            urun_fiyat: pdts[i].yenifiyat,
            urun_resmi: pdts[i].urunResim,
          )),
    );
  }
}

class urun extends StatelessWidget {
  final urun_adi;
  final urun_resmi;
  final urun_eski_fiyat;
  final urun_fiyat;
  final urun_hakkinda;

  urun(
      {this.urun_adi,
      this.urun_resmi,
      this.urun_eski_fiyat,
      this.urun_fiyat,
      this.urun_hakkinda});

  @override
  Widget build(BuildContext context) {
    final pdt=Provider.of<urunn>(context,listen: false);
    //TEK ÜRÜNÜN ŞEKLİNİN OLUŞTUĞU YER
    return Card(
      child: Hero(
        tag: urun_adi,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(urunDetaylari.routeName,arguments: pdt.id);
            },
            child: GridTile(
              footer: Container(
                color: Colors.white60,
                child: ListTile(
                  leading: Container(
                    alignment: Alignment.center,
                    width: 70,
                    height: 80,
                    child: Text(
                      urun_adi,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  title: Container(
                    width: 80,
                    alignment: Alignment.center,
                    child: Text(
                      '$urun_fiyat TL',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800),
                    ),
                  ),
                  subtitle: Container(
                    width: 80,
                    alignment: Alignment.center,
                    child: Text(
                      '$urun_eski_fiyat TL',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ),
              ),
              child: Image.asset(urun_resmi,fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}
