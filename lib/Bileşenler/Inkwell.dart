import 'package:f_market/Bile%C5%9Fenler/worldTime.dart';
import 'package:f_market/Bileşenler/Functions.dart';
import 'package:f_market/Bileşenler/Authentication.dart';
import 'package:f_market/pages/account.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class totalInkwell extends StatefulWidget {

  @override
  _totalInkwellState createState() => _totalInkwellState();
}

class _totalInkwellState extends State<totalInkwell> {
  worldTime objectt=worldTime();
  String time="Yükleniyor...";
  Functions object=Functions();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    objectt.getTime().then(
            (val){
          setState(() {
            time=val;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Inkwell(
          text: 'Ana Sayfa',
          icon: Icon(
            Icons.home,
            color: Colors.blue,
          ),
          onpressed: () {object.goToHomePage(context);},
        ),
        Inkwell(
          text: 'Sepetim',
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.blue,
          ),
          onpressed: () {
            object.goToShoppingBasket(context);
          },
        ),
        Inkwell(
          text: 'Hesabım',
          icon: Icon(
            Icons.person,
            color: Colors.blue,
          ),
          onpressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => account()));
          },
        ),
        Inkwell(
          text: 'İstatistikler',
          icon: Icon(
            Icons.equalizer,
            color: Colors.blue,
          ),
          onpressed: () {
            object.goToStaticsPage(context);
          },
        ),
        Inkwell(
          text: 'Favorilerim',
          icon: Icon(
            Icons.favorite,
            color: Colors.blue,
          ),
          onpressed: () {
            object.goToFavorite(context);
          },
        ),
        Inkwell(
          text: 'Ürünler',
          icon: Icon(
            Icons.inventory,
            color: Colors.blue,
          ),
          onpressed: () {
            object.goToProductsPage(context);
          },
        ),
        Inkwell(
          text: 'Hakkında',
          icon: Icon(
            Icons.help,
            color: Colors.red,
          ),
          onpressed: () {
            object.goToAboutPage(context);
          },
        ),
        Inkwell(
          text: 'Çıkış',
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onpressed: () {
            Provider.of<Authentication>(context, listen: false).signOut();
          },
        ),
        SizedBox(height: 30,),
        Text("Güncel Tarih:" + time,style: GoogleFonts.dancingScript(fontWeight: FontWeight.bold,fontSize: 20)),
      ],
    );
  }
}

class Inkwell extends StatelessWidget {
  final Function onpressed;
  final String text;
  final Icon icon;
  final Color color;

  Inkwell({Key key, this.onpressed, this.text, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: ListTile(
        title: Text(
          '$text',
          style: TextStyle(color: Colors.black87),
        ),
        leading: icon,
      ),
    );
  }
}
