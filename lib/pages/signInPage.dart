import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:f_market/pages/email_signIn.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../Bileşenler/Authentication.dart';


class signInPage extends StatefulWidget {
  @override
  _signInPageState createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  bool _isLoading = false;

  Future<void> _signInAnonymously()async{
    setState(() {
      _isLoading=true;
    });
    final user = await Provider.of<Authentication>(
        context,
        listen: false)
        .signInAnonymously();
    setState(() {
      _isLoading=false;
    });
  }
  Future<void> _signInWithGoogle()async{
    setState(() {
      _isLoading=true;
    });
    final user= await Provider.of<Authentication>(
        context,
        listen: false)
        .signInWithGoogle();
    setState(() {
      _isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/arkaplan.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logooo.png',
              width: 200,
              height: 200,
            ),
            Container(
                child: Text(
              'F MARKET',
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            )),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 220,
              child: RaisedButton(
                color: Colors.grey[10],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text('Anonim Olarak Giriş Yap'),
                  onPressed: _isLoading
                      ? null
                      : _signInAnonymously,
                        ),
            ),
            signInButtonWidget(
              //widgets.dart dosyasından çekiyoruz.
              text: ('Google İle Giriş Yap'),
              onPressed:
                _isLoading ? null:_signInWithGoogle,

              button: Buttons.Google,
            ),
            SizedBox(
              width: 220,
              child: RaisedButton(
                color: Colors.grey[10],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text('E Mail İle Giriş yap'),
                onPressed: _isLoading
                    ? null
                    : (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>emailSignIn()));
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
