import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Map loadingData = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    //print(data);
    String bgImage = data['isDaytime'] ? 'day3.jpg' : 'night3.jpg';

    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/${data['flag']}'),
                  radius: 40.0,
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: TextStyle(
                            fontSize: 40.0,
                            color: bgImage == 'day3.jpg' ? Colors.black : Colors.white,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 65.0,
                    color: bgImage == 'day3.jpg' ? Colors.black : Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 300,
                ),
                RaisedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDaytime': result['isDaytime'],
                      };
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Change location',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.lightBlue[200],
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                  icon: Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Make Default',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.lightBlue[100],
                )
              ],
            ),
          )),
        ));
  }
}
