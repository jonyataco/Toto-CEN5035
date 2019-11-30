import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:toto_real/Tabs/PawScreen/PawScreen.dart';
import 'scheduleWidget.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(DateTimePicker());

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _date = "Not set";
  String _time = "Not set";
  String hello = '';
  
  final databaseReference = FirebaseDatabase.instance.reference()
  .child('schedule');
 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule',
               style: TextStyle(color: Colors.red,
               fontSize: 27,
               ),
        ),
    
      ),
      body: 
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/Snow4.gif"), fit:BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                easterEgg(), 
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
                                    color: Colors.red,
                                  ),
                                  Text(
                                    " $_time",
                                    style: TextStyle(
                                        color: Colors.red,
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
                              color: Colors.red,
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
                    createRecordDaily();
                    Navigator.pop(context);
                    },

                    //child: Text("Repeat Daily")
                    
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
                                    //Icons.alarm_add,
                                    //Icons.cached,
                                    Icons.autorenew,
                                    size: 18.0,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    " Repeat Daily",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        /* Text(
                          "  Change",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ), */
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
                            //Navigator.pop(context);
                            //Navigator.pushReplacementNamed(context, '/PawScreen/PawScreen');
                            createRecordOnce();
                            Navigator.pop(context);
                          },
                          //child: Text("Repeat Once"),
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
                                    //Icons.alarm_off,
                                    Icons.blur_on,
                                    size: 18.0,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    " Repeat Once",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        /* Text(
                          "  Change",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ), */
                      ],
                    ),
                  ),
                  color: Colors.white,
                  ),

                RaisedButton(
                  onPressed: (){
                    getData();
                  },
                  child: Text(hello),
                  )

              ],
            ),
          ),
        ),
      ),
    );
  }


void createRecordDaily(){
   // databaseReference.child("schedule").set({
     databaseReference.set({
      'Date': '$_date',
      'Time': '$_time',
      'Daily':'true',
    });
   /*  databaseReference.child("2").set({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    }); */
  }
  void createRecordOnce(){
   // databaseReference.child("schedule").set({
     databaseReference.set({
      'Date': '$_date',
      'Time': '$_time',
      'Daily':'false',
    });
   /*  databaseReference.child("2").set({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    }); */
  }
  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
     hello = (snapshot.value).toString();
    });


  /* db = FirebaseDatabase.instance.reference().child("zoom_users");
      db.once().then((DataSnapshot snapshot){
        Map<dynamic, dynamic> values = snapshot.value;
          values.forEach((key,values) {
            print(values["name"]);
          });
      }); */
  }

  void updateData(){
    databaseReference.child('schedule').update({
      'Date': '$_date',
      'Time': '$_time',
      'Daily':'false',
    });
  }

  void deleteData(){
    databaseReference.child('schedule').remove();
  }
}

Widget easterEgg() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 100.0, //changed from 48
          child: Image.asset('assets/Snow3.gif',
          ),
          
        ),
      ),
    );
  }
