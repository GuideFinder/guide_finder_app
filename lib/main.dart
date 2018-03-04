import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTargetPlatform == TargetPlatform.iOS         //new
          ? kIOSTheme                                              //new
          : kDefaultTheme,
      home: new MyHomePage(title: 'TravelGuide'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controller = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: new Color.fromRGBO(76, 204, 136,1.0),
      body: new Center(

          child: new Row(


            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(8.0),
              ),



              new Expanded(

                child: new TextField(

                  textAlign: TextAlign.left,
                  controller: _controller,

                  decoration: new InputDecoration(

                    hintText: 'Type a location',
                  ),
                ),

              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
              ),
              new RaisedButton(

                onPressed: () {
                  showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text('What you typed'),
                      content: new Text(_controller.text),


                    ),
                  );
                },
                child: const Icon(Icons.search),
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
              ),

            ],
          )


      ),


    );
  }

}


