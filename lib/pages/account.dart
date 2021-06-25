import 'package:f_market/Bileşenler/Functions.dart';
import 'package:flutter/material.dart';


class account extends StatelessWidget {
  Functions object=Functions();
  @override
  Widget build(BuildContext context) {
   // Functions object=Functions();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff555555),
        leading: IconButton(icon: Icon(Icons.home), onPressed: () {object.goToHomePage(context);}),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin:EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   //------------------------------------------------------------------------------------
                    Card(
                      color: Color(0xff555555),
                      child: ListTile(
                        leading: Icon(Icons.email,color: Colors.red,),
                        title: Text('${object.getCurrentUser('email')}',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Card(
                      color: Color(0xff555555),
                      child: ListTile(
                        leading: Icon(Icons.person,color: Colors.red,),
                        title: Text('${object.getCurrentUser('isim')}',style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 80)),
                  ],
                ),
              ),
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: resim(),
          ),
          Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  child: Text(
                    'Hesabım',
                    style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  padding: EdgeInsets.all(10.0)),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width/2,
                height: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(object.getCurrentUser('photo')),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 270,left: 184),
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(icon: Icon(Icons.edit),color: Colors.white,onPressed: (){},),

          ),
          ),

        ],
      ),
    );
  }
}

class resim extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    Paint paint=Paint()..color=Color(0xff555555);
    Path path=Path()..relativeLineTo(0, 150)..quadraticBezierTo(size.width/2, 225, size.width,150)..relativeLineTo(0, -150)..close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}