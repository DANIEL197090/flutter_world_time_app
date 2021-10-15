import 'package:http/http.dart';
import 'dart:convert';
class WorldTime {
  String location; // location name for the UI
  String time = ''; // time in that location
  String flag; // url to an asset flag icon
  String url; // location url

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // make request
      Response response =  await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));
      // set the time property
      time = now.toString();
    }catch(e){
      print('error $e');
      time = 'Could not get time data';
    }

  }
}






// String username =  await Future.delayed(Duration(seconds: 5) , () {
//   return 'Daniel';
// });
// String bio =  await Future.delayed(Duration(seconds: 2) , () {
//   return ('I am a software developer');
// });
// print('$username - $bio');