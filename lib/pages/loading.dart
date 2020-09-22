import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingInfo{
  String location;
  String flag;
  String url;

  LoadingInfo({this.location,this.flag,this.url});

}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

    Map load = {
      'location' : 'Dhaka',
      'url' : 'Asia/Dhaka',
      'flag': 'bangladesh.png',
    };

  void setTime() async {
    WorldTime instance = WorldTime(
        location:  load['location'],
        flag: 'bangladesh.png',
        url:  load['url'] );
    await instance.getTime();
    if (instance.isDataRetrieved == true) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      });
    } else {
      // the lines are for going to home before going to error page
      //so that it can be back to home and change the location

      /* Navigator.pushReplacementNamed(context,'/home',arguments: {
        'location' : instance.location,
        'flag': instance.flag,
        'time': 'Change Location',
      // });*/

      Navigator.pushNamed(context, '/exception', arguments: {
        'location': instance.location,
        'time': instance.time,
        'flag': instance.flag,
        'isDaytime': instance.isDaytime,
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.blue[300],
        body: Center(
          child: SpinKitFadingCircle(
            color: Colors.red,
            size: 50.0,
          ),
        ));
  }
}
