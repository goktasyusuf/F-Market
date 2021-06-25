import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Kart.dart';
class sepetTekUrun extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;


  sepetTekUrun(this.id, this.productId, this.price, this.quantity, this.name);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction){
        Provider.of<Cart>(context,listen: false).urunSil(productId);
      },
      child: Card(
        child: ListTile(
          leading: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('$price TL',style: TextStyle(fontSize: 18,color: Colors.blue),)
          ),
          title: Text('$name'),
         subtitle: Text('Toplam: ${(price*quantity)} TL'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}