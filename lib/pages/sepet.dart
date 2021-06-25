import 'package:f_market/Bileşenler/sepetTekUrun.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../Bileşenler/Functions.dart';
import '../Bileşenler/Kart.dart';



class sepet extends StatefulWidget {
  static const routeName='/sepet';
  @override
  _sepetState createState() => _sepetState();
}

class _sepetState extends State<sepet> {


  double toplam=0;
  Functions object=Functions();
  @override

  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context,listen: false);
    for(int i=0;i<cart.items.length;i++){
      toplam+= cart.items.values.toList()[i].fiyat*(cart.items.values.toList()[i].adet);}
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(icon:Icon(Icons.favorite), onPressed:(){object.goToFavorite(context);}),
        automaticallyImplyLeading: false,
        elevation: 0.1,
        backgroundColor: Colors.blue,
        title: Center(child: Text('Sepetim', style: GoogleFonts.playfairDisplay(fontSize: 25),)),
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
                  itemCount: cart.items.length,
                  itemBuilder:(ctx,i)=>sepetTekUrun(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].fiyat,
                    cart.items.values.toList()[i].adet,
                    cart.items.values.toList()[i].isim,
                  )),
            ),
          ],
        ),
      ),
       bottomNavigationBar: Container(
         height: 65,
         color: Colors.white,
         child: Row(
           children: [
             Expanded(
               child: ListTile(
                 title: Text('Toplam:'),
                 subtitle: Text('$toplam TL'),
               ),
             ),
             Expanded(
               child: MaterialButton(
                 color: Colors.blue,
                 onPressed: (){},
                 child: Text('ÖDE',style: TextStyle(color: Colors.white),),
               ),
             ),
           ],
         ),
       ),
    );
  }
}
