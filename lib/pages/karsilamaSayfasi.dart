import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:f_market/main.dart';
import 'package:f_market/pages/signInPage.dart';
import 'package:provider/provider.dart';
import '../Bileşenler/Authentication.dart';

class onBoardWidget extends StatefulWidget {
  @override
  _onBoardWidgetState createState() => _onBoardWidgetState();
}

class _onBoardWidgetState extends State<onBoardWidget> {
  @override
  Widget build(BuildContext context) {
    final _auth=Provider.of<Authentication>(context,listen: false);
    return StreamBuilder<User>(
      stream: _auth.authStatus(),
      builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){

        if(snapshot.connectionState==ConnectionState.active){
          return snapshot.data!=null?HomePage():signInPage();
        }
        else{
          return SizedBox(height: 300,width: 300,child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
