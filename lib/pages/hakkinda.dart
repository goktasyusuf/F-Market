import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Bileşenler/Functions.dart';

class hakkindaPage extends StatefulWidget {
  @override
  _hakkindaPageState createState() => _hakkindaPageState();
}

class _hakkindaPageState extends State<hakkindaPage> {
  Functions object = Functions();
  double _fontSize = 20;
  final double _baseFontSize = 20;
  double _fontScale = 1;
  double _baseFontScale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            object.goToHomePage(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                object.goToShoppingBasket(context);
              }),
        ],
        automaticallyImplyLeading: false,
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Center(
            child: Text(
          'F Market',
          textAlign: TextAlign.center,
          style: GoogleFonts.aladin(color: Colors.white, fontSize: 35),
        )),
      ),
      body: GestureDetector(
        onScaleStart: (ScaleStartDetails scaleStartDetails) {
          _baseFontScale = _fontScale;
        },
        onScaleUpdate: (ScaleUpdateDetails scaleUpdateDetails) {
          if (scaleUpdateDetails.scale == 1.0) {
            return;
          }
          setState(() {
            _fontScale =
                (_baseFontScale * scaleUpdateDetails.scale).clamp(0.5, 5.0);
            _fontSize = _fontScale * _baseFontSize;
          });
        },
        onVerticalDragEnd: (asd){
          Navigator.pop(context);
        },

        child: Stack(
          children: [
            Center(
              child: Container(
                //width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/arka2.jpg'),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Text(
                    'Bu uygulama Dr.Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301024 numaralı Yusuf Göktaş tarafından 25 Haziran 2021 günü yapılmıştır.',
                    style: GoogleFonts.arya(
                        fontSize: _fontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
