import 'package:firebase_database/firebase_database.dart';

class Firebase {
  String key;
  String userId;

  String levels;
  String foodDispensing;
  String foodLevel;
  String waterLevel;

  String schedule;
  String daily;
  String date;
  String time;


  

  Firebase(this.daily, this.time, this.date);

  Firebase.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    date = snapshot.value["Date"],
    time = snapshot.value["Time"],
    daily = snapshot.value["Daily"];


  toJson() {
    return {
      "date": date,
      "time": time,
      "daily": daily,
    };
  }
}