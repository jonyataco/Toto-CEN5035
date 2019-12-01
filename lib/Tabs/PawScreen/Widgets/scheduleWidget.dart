import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'schedulepage.dart';
import 'package:firebase_database/firebase_database.dart';

class Schedule extends StatelessWidget {
  final String _scheduleDetails;
  final String _scheduleButtonText;
  
  final dbRef = FirebaseDatabase.instance.reference()
  .child('schedule');
  //arturo
  Schedule(this._scheduleDetails,this._scheduleButtonText);
  String schedule = "getSchedule";
 //String schedule2 = 'Data : ${snapshot.value}';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Center(
              
              child:  Text(
                //'Your next feeding time is (FEEDING TIME)', arturo
                getData() ?? schedule,
                //schedule,
                
                style: TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.bold
                ),
                
              ), 

            /*   RaisedButton(
                  onPressed: (){
                    getData();
                  },
                  child: Text(schedule2),
                  ) */
            )
          )
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(right: 30),
            child: RaisedButton(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              ),
              onPressed: ()// => {print('Editing the schedule')},
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DateTimePicker()),
                );
              },
              color: Colors.cyan,
              child: Text(
                'Edit schedule',
                style: TextStyle(fontSize: 17.0, color: Colors.deepOrange),
              )
            )
          )
        )
      ],
    );
  }

  getData(){
    dbRef.once().then((DataSnapshot snapshot) {
     print('Data : ${snapshot.value}');
     schedule = (snapshot.value).toString();
     //print('Data : ${snapshot.value}');
     //print(schedule);
    });
  }
}

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Schedule"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            
              Navigator.pop(context);
              
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
  
}

/* class SchedulePage2 extends StatelessWidget {
  
  String _date = "Not set";
  String _time = "Not set";

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showTimePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true, onConfirm: (time) {
                    print('confirm $time');
                    _time = '${time.hour} : ${time.minute} : ${time.second}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.access_time,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_time",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
  
} */

  class firebaseSchedule {
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
  

  firebaseSchedule(this.daily, this.time, this.date);

  firebaseSchedule.fromSnapshot(DataSnapshot snapshot) :
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