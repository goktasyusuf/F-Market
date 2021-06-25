import 'package:f_market/Bileşenler/Functions.dart';
import 'package:f_market/pages/urun_listeleri.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'urun_detaylari.dart';

class kategoriUrun extends StatefulWidget {
  final urun_adi1;
  final urun_resmi1;
  final urun_fiyat1;
  final urun_adi2;
  final urun_resmi2;
  final urun_fiyat2;
  final baslik;

  kategoriUrun({
    this.urun_adi1,
    this.urun_resmi1,
    this.urun_fiyat1,
    this.urun_adi2,
    this.urun_resmi2,
    this.urun_fiyat2,
    this.baslik,
  });

  @override
  _kategoriUrunState createState() => _kategoriUrunState();
}

class _kategoriUrunState extends State<kategoriUrun> {
  @override
  Widget build(BuildContext context) {
    int a;
    final productData = Provider.of<urunlerrr>(context, listen: false);
    final pdts = productData.items;
    Functions object = Functions();
    if (widget.urun_adi1 == 'Basketbol Topu') {
      a = 0;
    }
    if (widget.urun_adi1 == 'Monitör') {
      a = 2;
    }
    if (widget.urun_adi1 == 'Cilt Bakım Seti') {
      a = 4;
    }
    if (widget.urun_adi1 == 'Pantolon') {
      a = 6;
    }
    if (widget.urun_adi1 == 'Buzdolabı') {
      a = 8;
    }
    if (widget.urun_adi1 == 'Koltuk Takımı') {
      a = 10;
    }
    if (widget.urun_adi2 == 'Futbol Topu') {
      a = 1;
    }
    if (widget.urun_adi2 == 'Bilgisayar Kasası') {
      a = 3;
    }
    if (widget.urun_adi2 == 'Şampuan') {
      a = 5;
    }
    if (widget.urun_adi2 == 'Ceket') {
      a = 7;
    }
    if (widget.urun_adi2 == 'Çamaşır Makinesi') {
      a = 9;
    }
    if (widget.urun_adi2 == 'Oyuncu Koltuğu') {
      a = 11;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              object.goToHomePage(context);
            }),
        centerTitle: true,
        title: Text(
          '${widget.baslik}',
          style: GoogleFonts.playfairDisplay(),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                object.goToShoppingBasket(context);
              }),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(urunDetaylari.routeName,
                    arguments: pdts[a - 1].id);
              },
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      widget.urun_resmi1,
                      width: 220,
                      height: 220,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          '${widget.urun_adi1}',
                          style: TextStyle(fontSize: 22, color: Colors.blue),
                        )),
                      ],
                    ),
                    Center(
                        child: Text(
                      '-${widget.urun_fiyat1}- TL',
                      style: TextStyle(fontSize: 22, color: Colors.blue),
                    )),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(urunDetaylari.routeName, arguments: pdts[a].id);
              },
              child: Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Image.asset(
                      widget.urun_resmi2,
                      width: 220,
                      height: 220,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          '${widget.urun_adi2}',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )),
                      ],
                    ),
                    Center(
                        child: Text(
                      '-${widget.urun_fiyat2}- TL',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
