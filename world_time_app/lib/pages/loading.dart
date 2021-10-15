import 'package:flutter/material.dart';
import 'package:world_time_app/pages/services/world_time.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'Loading...';
  void setupWordTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png',
        url: 'Europe/Berlin');
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWordTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding (
      padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
