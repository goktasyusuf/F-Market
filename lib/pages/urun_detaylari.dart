import 'package:f_market/pages/urun_listeleri.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Bileşenler/Functions.dart';
import '../Bileşenler/Kart.dart';



class urunDetaylari extends StatelessWidget {

  Functions object=Functions();
  @override
  static const routeName='productDetail';
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context).settings.arguments as
    String;
    final loadedPdt=Provider.of<urunlerrr>(context).idIleBul(productId);
    final pdt=Provider.of<urunn>(context,listen: false);
    final cart=Provider.of<Cart>(context,listen: false);
    final cartt=Provider.of<Cartt>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.home), onPressed: (){object.goToHomePage(context);}),
        automaticallyImplyLeading: false,
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
      body: GestureDetector(
        onHorizontalDragEnd: (asd){
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bgg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 25)),
              Container(
                height: 280.0,
                child: GridTile(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: Image.asset(loadedPdt.urunResim,),
                  ),
                  footer: Container(
                    //color: Colors.white,
                    child: ListTile(
                      leading: Text(
                        loadedPdt.urun_isim,
                        style: GoogleFonts.girassol(
                            fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                      title: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                          ),
                          Expanded(
                            child: Text(
                              '${loadedPdt.yenifiyat} TL',
                              style:
                                  TextStyle(color: Colors.blueAccent, fontSize: 20),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${loadedPdt.eskifiyat} TL',
                              style: TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        cart.urunEkle(loadedPdt.id, loadedPdt.urun_isim, loadedPdt.yenifiyat);
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 0.2,
                      child: Text('Sepete Ekle'),
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.blue,
                      size: 40,
                    ),
                    onTap: () {
                      cartt.urunEkle(loadedPdt.id, loadedPdt.urun_isim, loadedPdt.yenifiyat);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        padding: EdgeInsets.only(left: 135),
                        backgroundColor: Colors.white,
                        content: Text('Ürün Favorilere Eklendi!',style: TextStyle(color: Colors.blue),),
                      ));
                    },
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 35)),
              ListTile(
                title:Text('**Ürün Hakkında**',textAlign: TextAlign.center,style: GoogleFonts.bangers(fontSize: 30),),
                subtitle: Text(loadedPdt.aciklama,style:GoogleFonts.oswald(fontSize: 22,),textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
