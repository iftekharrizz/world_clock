import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for the UI
  String time; // the time in that location
  String flag; // url to net
  String url;
  bool isDataRetrieved;
  bool isDaytime;

  WorldTime({this.location,this.flag,this.url,this.isDataRetrieved});

  Future <void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from the data
      String dateTime = data['utc_datetime'];
      String offSet = data['utc_offset'].substring(0,3);
      print('$dateTime \n $offSet');

      //create a date time object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));

      //set time property
      isDaytime = now.hour > 6 && now.hour < 18 ;
      time = DateFormat.jm().format(now);
      isDataRetrieved = true;
      //print('class time = $time');

    }
    catch(e){
      //print('Sorry! The time could not be retrieved.');
      time = '''
  Sorry!
  You are not connected to the internet
  The time could not be retrieved
       ''';
      isDataRetrieved = false;
    }
  }

}