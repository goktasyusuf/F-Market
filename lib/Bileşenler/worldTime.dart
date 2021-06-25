import 'dart:convert';
import 'package:http/http.dart';

class worldTime{

   String sehir;
   DateTime time;
   int abr;

  Future<String> getTime () async{
    Response time=await get(Uri.parse("http://worldtimeapi.org/api/timezone/Europe/Istanbul"));
    Map json=jsonDecode(time.body);
    this.time=DateTime.parse(json["utc_datetime"]);
    this.abr=int.parse(json["abbreviation"]);
    this.time=this.time.add(Duration(hours: this.abr));
    return (this.time.day.toString() + "/"+this.time.month.toString()+ "/"+ this.time.year.toString()+ "\n"+"Güncel Saat:" +this.time.hour.toString() +":" +this.time.minute.toString());
  }
}