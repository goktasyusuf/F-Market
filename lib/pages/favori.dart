import 'package:f_market/Bileşenler/Functions.dart';
import 'package:f_market/Bileşenler/favoriTekUrun.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../Bileşenler/Kart.dart';



class favori extends StatefulWidget {
  static const routeName='/favori';

  @override
  _sepetState createState() => _sepetState();
}

class _sepetState extends State<favori> {


  Functions object=Functions();
  @override

  Widget build(BuildContext context) {
    final cartt=Provider.of<Cartt>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(icon:Icon(Icons.shopping_cart), onPressed:(){object.goToShoppingBasket(context);}),
        automaticallyImplyLeading: false,
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Center(child: Text('Favorilerim',style: GoogleFonts.shadowsIntoLight(color: Colors.white, fontSize: 35),)),
        actions: [
          IconButton(icon:Icon(Icons.home), onPressed:(){
            object.goToHomePage(context);
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
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartt.items.length,
                  itemBuilder:(ctx,i)=>favoriTekUrun(
                    cartt.items.values.toList()[i].id,
                    cartt.items.keys.toList()[i],
                    cartt.items.values.toList()[i].isim,
                    cartt.items.values.toList()[i].fiyat,
                  )),
            ),
          ],
        ),
      ),

    );
  }
}
