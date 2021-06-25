import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import '../Bileşenler/Authentication.dart';
import '../Bileşenler/Functions.dart';

enum FormStatus { register, signIn, reset }

class emailSignIn extends StatefulWidget {
  @override
  _emailSignInState createState() => _emailSignInState();
}

class _emailSignInState extends State<emailSignIn> {
  FormStatus _formStatus = FormStatus.signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/arkaplan.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: _formStatus == FormStatus.signIn
              ? buildSignInForm()
              : _formStatus == FormStatus.register
                  ? buildRegisterForm()
                  : buildResetPasswordForm(),
        ),
      ),
    );
  }

  Widget buildSignInForm() {
    Functions object=Functions();
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    final _signInFormKey = GlobalKey<FormState>();
    return Form(
      key: _signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Lütfen Giriş Yapınız',
            style: GoogleFonts.teko(fontSize: 40, color: Colors.grey),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: _email,
            validator: (value) {
              if (EmailValidator.validate(value)) {
                return null;
              } else {
                return 'Lütfen Doğru giriniz';
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'E mailinizi Giriniz',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _password,
            validator: (val) {
              if (val.length < 7) {
                return 'Şifreniz 7 haneden küçük olamaz!';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              hintText: 'Şifrenizi Giriniz',
              prefixIcon: Icon(Icons.lock),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                if (_signInFormKey.currentState.validate()) {
                  final user = await Provider.of<Authentication>(context,
                          listen: false)
                      .signInWithEmailandPassword(_email.text, _password.text);
                  if (!user.emailVerified) {
                    await object.showMyDialogSignIn(context);
                    await Provider.of<Authentication>(context, listen: false)
                        .signOut();
                  }
                  Navigator.pop(context);
                }
              },
              child: Text('GİRİŞ')),
          SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.register;
                });
              },
              child: Text(
                'Yeni Kayıt İçin Tıklayınız',
                style: TextStyle(fontSize: 19, color: Colors.deepPurple),
              )),
          TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.reset;
                });
              },
              child: Text(
                'Şifrenizi mi unuttunuz?',
                style: TextStyle(fontSize: 18, color: Colors.deepOrange),
              )),
        ],
      ),
    );
  }

  Widget buildRegisterForm() {
    Functions object=Functions();
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _confirmPassword = TextEditingController();

    final _registerFormKey = GlobalKey<FormState>();
    return Form(
      key: _registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Kayıt Formu',
            style: GoogleFonts.teko(fontSize: 40, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _email,
            validator: (value) {
              if (EmailValidator.validate(value)) {
                return null;
              } else {
                return 'Lütfen Doğru Giriniz';
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'E mailinizi Giriniz',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _password,
            validator: (value) {
              if (value.length < 7) {
                return 'Şifreniz 7 haneden küçük olamaz.';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'Şifrenizi Giriniz',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _confirmPassword,
            validator: (value) {
              if (value != _password.text) {
                return 'Şifreler Eşleşmiyor!';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'Şifrenizi Onaylayınız',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                if (_registerFormKey.currentState.validate()) {
                  final user =
                      await Provider.of<Authentication>(context, listen: false)
                          .createNewUserWithEmailandPassword(
                              _email.text, _password.text);
                  if (!user.emailVerified) {
                    await user.sendEmailVerification();
                  }
                  await object.showMyDialog(context);
                  await Provider.of<Authentication>(context, listen: false)
                      .signOut();
                  setState(() {
                    _formStatus = FormStatus.signIn;
                  });
                }
              },
              child: Text('KAYIT OL')),
          TextButton(
            onPressed: () {
              setState(() {
                _formStatus = FormStatus.signIn;
              });
            },
            child: Text(
              'Zaten üye misiniz? Tıklayınız',
              style: TextStyle(fontSize: 22, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  Widget buildResetPasswordForm() {
    Functions object=Functions();

    TextEditingController _email = TextEditingController();
    final _resetPasswordFormKey = GlobalKey<FormState>();
    return Form(
      key: _resetPasswordFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Şifre Yenileme',
            style: GoogleFonts.teko(fontSize: 40, color: Colors.grey),
          ),
          SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: _email,
            validator: (value) {
              if (EmailValidator.validate(value)) {
                return null;
              } else {
                return 'Lütfen Doğru giriniz';
              }
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'E mailinizi Giriniz',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                if (_resetPasswordFormKey.currentState.validate()) {
                  Provider.of<Authentication>(context, listen: false)
                      .sendPasswordResetEmail(_email
                          .text);
                  await object.showMyDialogResetPassword(context);
                  Navigator.pop(context);
                }
              },
              child: Text('GÖNDER')),
        ],
      ),
    );
  }

}
