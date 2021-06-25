import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Kart.dart';
class favoriTekUrun extends StatelessWidget {
  final String id;
  final String productId;
  final String name;
  final double price;

  favoriTekUrun(this.id, this.productId, this.name, this.price);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction){
        Provider.of<Cartt>(context,listen: false).urunSil(productId);
      },
      child: Card(
        child: ListTile(
          leading: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('$price TL',style: TextStyle(fontSize: 18,color: Colors.blue),)
              ),
          title: Text('$name'),
          trailing: Text('F Market',style: GoogleFonts.dancingScript(fontWeight: FontWeight.bold,fontSize: 18)),
          subtitle: Text('Ürün Kodu= $productId'),
        ),
      ),
    );
  }
}