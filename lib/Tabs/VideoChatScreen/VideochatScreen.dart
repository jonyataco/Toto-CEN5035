import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';

void main() => runApp(VideoScreen());

class VideoScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // title: 'video test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage2(title: 'Pi 4 Stream'),
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  String _streamUrl;
  VlcPlayerController _vlcViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _vlcViewController = new VlcPlayerController();
  }

  void _incrementCounter() {
    setState(() {
      if (_streamUrl != null) {
        _streamUrl = null;
      } else {
        _streamUrl = 'http://192.168.0.15:8081';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
     // appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
     // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _streamUrl == null
                ? 
                   Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                            /* RaisedButton(
                                  onPressed: (){},
                                  child: Text('Hello Flutter Master',
                                  style: TextStyle(
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    textBaseline: TextBaseline.alphabetic
                                ),),
                                
                            ), */

                            Padding(
                              //padding: EdgeInsets.all(10.0),
                              padding: EdgeInsets.only(top: 10.0),
                              child: Image.asset(
                              'assets/test1.jpg',
                                 ),
                            ),

                            Padding(
                              //padding: EdgeInsets.all(1.0),
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: RichText(
                                text: TextSpan(children: [  
                                      TextSpan(
                                        text: 'Stream Closed',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,)
                                            //background: Paint()..color = Colors.white),
                                      )
                                    ]),
                              ),
                            ),

                            /* Center(
                                
                                child: RichText(
                                  text: TextSpan(children: [  
                                    TextSpan(
                                      text: 'Stream Closed',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,)
                                          //background: Paint()..color = Colors.white),
                                    )
                                  ]),
                                ),
                              ), */

                     ],)
                  
/*                     child: Center(
                      
                      child: RichText(
                        text: TextSpan(children: [  
                          TextSpan(
                            text: 'Stream Closed',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                background: Paint()..color = Colors.grey),
                          )
                        ]),
                      ),
                    ), */
                  

                : new VlcPlayer(
                    defaultHeight: 480,
                    defaultWidth: 640,
                    /* defaultHeight: 480,
                    defaultWidth: 360, */
                    url: _streamUrl,
                    controller: _vlcViewController,
                    placeholder: Container(),
                  ), 
              Align(
                alignment: Alignment.bottomCenter,
               child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: RaisedButton(
                onPressed: 
                   _incrementCounter,
                child: Icon(
                   _streamUrl == null ? Icons.play_arrow : Icons.pause, size: 50,),
                //textspam: Text("Play"),
                padding: EdgeInsets.all(30),
                shape: CircleBorder(side: BorderSide(color: Colors.cyan, width: 10),)
              ),
                      ),
                 
            ),
                                
           /*    new RaisedButton(
                
                onPressed: 
                   _incrementCounter,
                
                child: Icon(
                   _streamUrl == null ? Icons.play_arrow : Icons.pause, size: 60,),
                //textspam: Text("Play"),
                padding: EdgeInsets.all(30),
                shape: CircleBorder(side: BorderSide(color: Colors.cyan, width: 10),)
              ) */

          ],
        ),
      ),
     /*  floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(_streamUrl == null ? Icons.play_arrow : Icons.pause),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}