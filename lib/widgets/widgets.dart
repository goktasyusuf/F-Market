import 'package:carousel_pro/carousel_pro.dart';
import 'package:f_market/Bile%C5%9Fenler/Functions.dart';
import 'package:f_market/Bileşenler/Inkwell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class signInButtonWidget extends StatelessWidget {
  final String text;
  final Buttons button;
  final Function onPressed;

  const signInButtonWidget({Key key, this.text, this.button, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      button,
      onPressed: onPressed,
      text: text,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
} //------------------------SIGNINPAGE BUTTON WIDGET-------------

class InkwellWidget extends StatelessWidget {
  final Function onpressed;
  final String text;
  final Icon icon;
  final Widget color;

  const InkwellWidget(
      {Key key, this.onpressed, this.text, this.icon, this.color})
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
} //-------------MAIN.DART INKWELL WIDGET-----------------

Widget kayan_resimler = Container(
  //değişen resimleri oluşturduğumuz yer
  height: 200,
  child: Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('assets/images/m1.jpg'),
      AssetImage('assets/images/m2.jpg'),
      AssetImage('assets/images/a3.jpg'),
      AssetImage('assets/images/a4.jpg'),
      AssetImage('assets/images/a5.jpg'),
    ],
    autoplay: true,
    dotSize: 4.0,
    indicatorBgPadding: 2.0,
    dotBgColor: Colors.transparent,
  ),
); //-----------------------MAIN.DART KAYAN RESIM WIDGET-------------------

Widget Drawerr() {
  Functions object = Functions();
  return Container(
    width: 280,
    color: Colors.white,
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          accountName: Text(
            object.getCurrentUser('isim'),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          accountEmail: Text(
            object.getCurrentUser('email').toString(),
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          currentAccountPicture: GestureDetector(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(object.getCurrentUser('photo')),
                ),
              ),
            ),
          ),
        ),
        totalInkwell(), //Inkweller'i sıraladığımız yer.
      ],
    ),
  );
} //--------------MAIN.DART DRAWER WIDGET------------------
