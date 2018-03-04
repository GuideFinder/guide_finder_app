import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:guide_finder_app/guide.dart';

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
      theme: defaultTargetPlatform == TargetPlatform.iOS //new
          ? kIOSTheme //new
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


  void _goToGuidesPage() {
    final _guides = new Set<Guide>();
    _guides.add(new Guide("Philippe Lam"));
    _guides.add(new Guide("Isaac Patteau"));
    _guides.add(new Guide("Emmanuel Proulx"));
    _guides.add(new Guide("Sylvain Dégué"));

    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _guides.map(
                (guide) {
              return new ListTile(
                title: new Text(
                  guide.name,
                ),
                /*leading: new CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: new Text(str.substring(0, 1))
                ),*/
                leading: new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://picsum.photos/100"),
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Guides found'),
            ),
            body: new ListView(children: divided),

          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: new Color.fromRGBO(76, 204, 136, 1.0),
      body: new Center(


          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[


              new Expanded(
                child: new Image.asset('graphics/Capture.png'),
              ),

              new Flexible(child:
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),


                  new Expanded(

                    child: new TextField(
                      style: new TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Qanelas', fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                      controller: _controller,

                      decoration: new InputDecoration(
                        hintStyle: new TextStyle(color:Colors.white.withOpacity(0.7), fontSize: 20.0,fontFamily: 'Qanelas', fontStyle: FontStyle.normal ),
                        hintText: 'Type a location',
                      ),
                    ),

                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  new RaisedButton(

                    onPressed: _goToGuidesPage,
                    child: const Icon(Icons.search),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),

                ],

              ),

              ),


            ],
          )
      ),

    );
  }

}


