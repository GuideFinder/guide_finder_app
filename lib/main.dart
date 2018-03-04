import 'package:flutter/material.dart';
import 'package:guide_finder_app/contact_item.dart';
import 'package:guide_finder_app/guide.dart';
import 'CalendarScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder> {
        '/CalendarScreen': (BuildContext context) => new CalendarScreen(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _goToGuidesPage() {
    final _guides = new Set<Guide>();
    _guides.add(new Guide("Philippe Lam", "French", "Montreal", "Canada", "5141231234", "pl@dfdsf.com"));
    _guides.add(new Guide("Isaac Patteau", "Japanese", "Kyoto", "Japan", "5141231234", "df@dfdsf.com"));
    _guides.add(new Guide("Emmanuel Proulx", "English", "Montreal", "Canada", "5141231234", "sdfl@dfdsf.com"));
    _guides.add(new Guide("Sylvain Dégué", "English", "Montreal", "Canada", "5141231234", "dfd@dfdsf.com"));

    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _guides.map(
                (guide) {
                  NetworkImage avatar = new NetworkImage(guide.avatarUrl);
              return new ListTile(
                title: new Text(
                  guide.name,
                ),
                subtitle: new Text(
                  guide.city + ", " + guide.country + "\n" + guide.language
                ),
                /*leading: new CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: new Text(str.substring(0, 1))
                ),*/
                leading: new CircleAvatar(
                  backgroundImage: avatar,
                ),
                onTap: () {
                  _goToGuideDetailsPage(guide);
                },
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
              title: new Text('Guides Found'),
            ),
            body: new ListView(children: divided),

          );
        },
      ),
    );
  }

  void _goToGuideDetailsPage(Guide guide) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {

          return new Scaffold(
            appBar: new AppBar(
              title: new Text(guide.name),
            ),
            body: new Column(
              children: <Widget>[
                new ContactItem(
                  icon: Icons.phone,
                  lines: <String>[
                    guide.phoneNumber,
                    'Phone number',
                  ],
                ),
                new ContactItem(
                  icon: Icons.language,
                  lines: <String>[
                    guide.language,
                    'Language',
                  ],
                ),
                new ContactItem(
                  icon: Icons.my_location,
                  lines: <String>[
                    guide.city + ", " + guide.country,
                    'Location',
                  ],
                ),
                new ContactItem(
                  icon: Icons.email,
                  lines: <String>[
                    guide.emailAddress,
                    'Email Address',
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _goToGuidesPage,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
