import 'package:f_market/pages/animations.dart';
import 'package:f_market/pages/favori.dart';
import 'package:f_market/pages/hakkinda.dart';
import 'package:f_market/pages/sepet.dart';
import 'package:f_market/pages/urunler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Functions {
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('E Posta Onayı Gerekiyor.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Lütfen onay için e mail kutunuza bakınız.'),
                Text('Onaylayıp Giriş yapabilirsiniz.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Anladım'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } //---FONKSİYON1-FOR BUILD REGISTER

  Future<void> showMyDialogResetPassword(BuildContext context) async {
    //--------------------------------------------------FONKSİYON
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ŞİFRE YENİLEME'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Lütfen e-mailinizi kontrol ediniz.'),
                Text('Linke tıklayarak şifrenizi değiştirebilirsiniz'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Anladım'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } //-FONKSİYON2-FOR BUILD RESET FORM

  Future<void> showMyDialogSignIn(BuildContext context) async {
    //--------------------------------------------------FONKSİYON
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('E Posta Onayı Vermemişsiniz.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Lütfen onay için e mail kutunuza yeniden bakınız.'),
                Text('Onaylayıp Giriş yapabilirsiniz.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Anladım'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } //-FONKSİYON3-FOR SIGN IN FORM

  void goToShoppingBasket(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800),
            transitionsBuilder: (context, animation, animationTime, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.bounceIn);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return sepet();
            }));
  }

  void goToAboutPage(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800),
            //----------------------------- Sayfa Geçiş Animasyıonu
            transitionsBuilder: (context, animation, animationTime, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.slowMiddle);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return hakkindaPage();
            }));
  } //Hakkında kısmına gidiş

  void goToHomePage(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800),
            //----------------------------- Sayfa Geçiş Animasyıonu
            transitionsBuilder: (context, animation, animationTime, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return HomePage();
            }));
  } //Ana Sayafa dönüş

  void goToStaticsPage(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800),
            //----------------------------- Sayfa Geçiş Animasyıonu
            transitionsBuilder: (context, animation, animationTime, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return BarChartSample1();
            }));
  } //İstatikler kısmına gidiş

  void goToProductsPage(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800),
            //----------------------------- Sayfa Geçiş Animasyonu
            transitionsBuilder: (context, animation, animationTime, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.decelerate);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return urunlerr();
            }));
  }

  void goToFavorite(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800),
            transitionsBuilder: (context, animation, animationTime, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInExpo);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return favori();
            }));
  } // //ürünler kısmına gidiş

  getCurrentUser(String a) {
    final User user = _auth.currentUser;
    final uid = user;
    if (a == 'photo') {
      if (uid.photoURL != null) {
        return uid.photoURL;
      } else {
        return 'https://cdn0.iconfinder.com/data/icons/social-media-network-4/48/male_avatar-512.png';
      }
    }
    if (a == 'email') {
      if(uid.email!=null){return uid.email;}
      else{
        return 'Anonim olarak giriş yapılmış';
      }

    }
    if (a == 'isim') {
      if (uid.displayName != null) {
        return uid.displayName;
      } else {
        return 'Kullanıcı';
      }
    }

  } //   Firebase'den fotoğraf ve email çekme
}
