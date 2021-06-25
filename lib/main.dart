import 'package:f_market/Bileşenler/Functions.dart';
import 'package:f_market/pages/account.dart';
import 'package:f_market/pages/favori.dart';
import 'package:f_market/pages/urun_detaylari.dart';
import 'package:f_market/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:f_market/Bileşenler/kategori_siralama.dart';
import 'package:f_market/Bileşenler/anasayfa_urunler.dart';
import 'package:f_market/pages/karsilamaSayfasi.dart';
import 'package:provider/provider.dart';
import 'Bileşenler/Authentication.dart';
import 'package:f_market/pages/urun_listeleri.dart';
import 'Bileşenler/Kart.dart';
import 'package:f_market/pages/sepet.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
     MultiProvider(
       providers: [
     Provider<Authentication>(
     create: (context) => Authentication()),
         ChangeNotifierProvider.value(value: urunlerrr()),
         ChangeNotifierProvider.value(value: Cart()),
         ChangeNotifierProvider.value(value: urunn()),
         ChangeNotifierProvider.value(value: Cartt()),
       ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: onBoardWidget(),

        routes: {
          urunDetaylari.routeName:(ctx)=>urunDetaylari(),
          sepet.routeName:(ctx)=>sepet(),
          favori.routeName:(ctx)=>favori(),
        },


    ),
     ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Functions object=Functions();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.blue,
          title: Center(
              child: Text(
            'F Market',
            style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 35),
          )),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  object.goToShoppingBasket(context);
                })
          ],
        ),
        drawer:Drawerr(),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2),
            ),
            Text(
              'Kategoriler',
              style: GoogleFonts.lobster(fontSize: 30),
            ),
            //Kategorilerin listelendiği yer.
            yatayKategoriListe(),
            Padding(padding: const EdgeInsets.all(10)),
            //Kayan resimlerin olduğu yer
            kayan_resimler,
            Padding(padding: const EdgeInsets.all(2.0)),
            Text(
              'Öne Çıkan Ürünler',
              style: GoogleFonts.lobster(fontSize: 30),
            ),
            Container(
              //Öne çıkan ürünlerin listelendiği yer.
              height: 290,
              child: urunler(),
            ),
          ],
        ),
      ),
    );
  }
}

