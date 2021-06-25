import 'package:f_market/pages/urun_listeleri.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:f_market/pages/urun_detaylari.dart';
import 'package:f_market/Bileşenler/Functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//   ----------------------------------------ÜRÜNLER KATEGORİSİNDEN GELEN ÜRÜNLER İÇİN ÜRÜN DETAYLARI SAYFASI------------------------------------


class urunlerr extends StatefulWidget {
  @override
  _urunlerrState createState() => _urunlerrState();
}

class _urunlerrState extends State<urunlerr> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<urunlerrr>(context,listen: false);
    Functions object=Functions();
    final pdts = productData.items;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                object.goToHomePage(context);
              }),
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          ],
          backgroundColor: Colors.blue,
          elevation: 0.1,
          title: Center(
              child: Text(
            'F Market',
            style: GoogleFonts.teko(color: Colors.white, fontSize: 35),
          )),
        ),
        body: ListView(
          children: [
            Center(
              child: Text(
                'Ürünler',
                style: GoogleFonts.lobster(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: pdts.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: pdts[i],
                  child: tekUrun(
                    urun_adi: pdts[i].urun_isim,
                    urun_hakkinda: pdts[i].aciklama,
                    urun_eski_fiyat: pdts[i].eskifiyat,
                    urun_fiyat: pdts[i].yenifiyat,
                    urun_resmi: pdts[i].urunResim,
                  )),
            ),
          ],
        ));
  }
}

class tekUrun extends StatelessWidget {
  urunDetaylari object = new urunDetaylari();
  @override
  final urun_adi;
  final urun_resmi;
  final urun_eski_fiyat;
  final urun_fiyat;
  final urun_hakkinda;

  tekUrun(
      {this.urun_adi,
      this.urun_resmi,
      this.urun_eski_fiyat,
      this.urun_fiyat,
      this.urun_hakkinda});


  Widget build(BuildContext context) {
    final pdt=Provider.of<urunn>(context);
    return GestureDetector(
      onLongPress: (){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
          content: Text("$urun_adi",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        ));
      },
      child: Card(
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
                child: Image.asset(
                  urun_resmi,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
