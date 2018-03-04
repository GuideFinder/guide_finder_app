import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:guide_finder_app/guide.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:guide_finder_app/contact_item.dart';
import 'CalendarScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(title: 'TravelGuide'),
      routes: <String, WidgetBuilder>{
        '/CalendarScreen': (BuildContext context) => new CalendarScreen()
      }
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
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _city = new TextEditingController();
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _adress = new TextEditingController();
  final TextEditingController _language = new TextEditingController();
  File imageFile;

  getImage() async {
    var _fileName = await ImagePicker.pickImage();
    setState(() {
      imageFile = _fileName;

    });


  }
  void _goToGuidesDescription(){
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: new AppBar(
            title: new Text('Describe yourself', style: new TextStyle(color: Colors.white),),
            backgroundColor: new Color.fromRGBO(76, 204, 136, 1.0),


          ),
          body: new Center(


              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                  ),
                  imageFile != null ? new Image.file(imageFile,height: 200.0,fit: BoxFit.fitWidth) : new Padding(
                     padding: new EdgeInsets.all(0.0),
                   ),
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                  ),
                  new Flexible  (

                    child: new TextField(
                      style: new TextStyle(color:new Color.fromRGBO(105, 57, 82,1.0) ,
                          fontSize: 20.0,
                          fontFamily: 'Qanelas',
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                      controller: _name,

                      decoration: new InputDecoration(
                        hintStyle: new TextStyle(
                            color:new Color.fromRGBO(105, 57, 82,0.7) ,
                            fontSize: 20.0,
                            fontFamily: 'Qanelas',
                            fontStyle: FontStyle.normal),
                        hintText: 'What is your name?',
                      ),
                    ),

                  ),

                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Flexible(

                    child: new TextField(
                      style: new TextStyle(color:new Color.fromRGBO(105, 57, 82,1.0) ,
                          fontSize: 20.0,
                          fontFamily: 'Qanelas',
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                      controller: _language ,

                      decoration: new InputDecoration(
                        hintStyle: new TextStyle(
                            color:new Color.fromRGBO(105, 57, 82,0.7) ,
                            fontSize: 20.0,
                            fontFamily: 'Qanelas',
                            fontStyle: FontStyle.normal),
                        hintText: 'What language do you speak?',
                      ),
                    ),

                  ),

                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Flexible(

                    child: new TextField(
                      style: new TextStyle(color:new Color.fromRGBO(105, 57, 82,1.0) ,
                          fontSize: 20.0,
                          fontFamily: 'Qanelas',
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                      controller: _city,

                      decoration: new InputDecoration(
                        hintStyle: new TextStyle(
                            color:new Color.fromRGBO(105, 57, 82,0.7) ,
                            fontSize: 20.0,
                            fontFamily: 'Qanelas',
                            fontStyle: FontStyle.normal),
                        hintText: 'In what city do you live?',
                      ),
                    ),

                  ),



                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Flexible(

                    child: new TextField(
                      style: new TextStyle(color:new Color.fromRGBO(105, 57, 82,1.0) ,
                          fontSize: 20.0,
                          fontFamily: 'Qanelas',
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                      controller: _phone,

                      decoration: new InputDecoration(
                        hintStyle: new TextStyle(
                            color:new Color.fromRGBO(105, 57, 82,0.7) ,
                            fontSize: 20.0,
                            fontFamily: 'Qanelas',
                            fontStyle: FontStyle.normal),
                        hintText: 'What is your phone number?',
                      ),
                    ),

                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Flexible(

                    child: new TextField(
                      style: new TextStyle(color:new Color.fromRGBO(105, 57, 82,1.0) ,
                          fontSize: 20.0,
                          fontFamily: 'Qanelas',
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                      controller: _adress,

                      decoration: new InputDecoration(
                        hintStyle: new TextStyle(
                            color:new Color.fromRGBO(105, 57, 82,0.7) ,
                            fontSize: 20.0,
                            fontFamily: 'Qanelas',
                            fontStyle: FontStyle.normal),
                        hintText: 'What is your email adress?',
                      ),
                    ),

                  ),
                  new Padding(
                    padding: new EdgeInsets.all(18.0),
                  ),
                  new RaisedButton(
                    onPressed:  _buildMenu,
                    child: const Icon(Icons.navigate_next, color: Colors.white,size: 20.0,),
                    color: new Color.fromRGBO(105, 57, 82,1.0),
                    shape: new StadiumBorder(),

                  ),


                ],
              )
          ),
        );
      }
      )
    );

  }
  void _goToGuidesCreatePage(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {


          return  new Scaffold(
            appBar: new AppBar(
              title: new Text('Create a Guide account', style: new TextStyle(color: Colors.white),),
              backgroundColor: new Color.fromRGBO(76, 204, 136, 1.0),


            ),
            backgroundColor: Colors.white,
            body: new Center(


                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.all(18.0),
                    ),
                    new Text(imageFile == null ? "Select a profile picture": "Perfect!",textAlign: TextAlign.center,style: new TextStyle(
                        color: new Color.fromRGBO(105, 57, 82,1.0),
                        fontSize: 40.0,
                        fontFamily: 'Qanelas',

                        fontStyle: FontStyle.normal),),

                    new Padding(
                      padding: new EdgeInsets.all(18.0),
                    ),

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[new RaisedButton(
                        onPressed: getImage,
                        child: const Icon(Icons.add_a_photo, color: Colors.white,size: 20.0,),
                        color: new Color.fromRGBO(105, 57, 82,1.0),
                        shape: new StadiumBorder(),

                      ),
                      new Padding(
                        padding: new EdgeInsets.all(18.0),
                      ),
                      new RaisedButton(
                        onPressed: _goToGuidesDescription,
                        child: const Icon(Icons.navigate_next, color: Colors.white,size: 20.0,),
                        color: new Color.fromRGBO(105, 57, 82,1.0),
                        shape: new StadiumBorder(),

                      ),
                    ],
                    ),
                  ],
                )
            ),

          );
        },
      ),
    );
  }

  NetworkImage networkImage;

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
                  networkImage = new NetworkImage(guide.avatarUrl);
              return new ListTile(
                title: new Text(
                  guide.name,
                ),
                subtitle: new Text(
                  guide.city + ", " + guide.country + "\n" + guide.language
                ),
                leading: new CircleAvatar(
                  backgroundImage: networkImage,
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
              backgroundColor: new Color.fromRGBO(105, 57, 82,1.0),
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
            body: new ListView(
              padding: new EdgeInsets.all(8.0),
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: networkImage,
                  radius: 50.0,
                ),
                new Padding(
                  padding: new EdgeInsets.only(bottom: 8.0),
                ),
                new ContactItem(
                  lines: <String>[
                    '',
                    guide.introduction,
                  ],
                ),
                new ContactItem(
                  icon: Icons.phone,
                  lines: <String>[
                    guide.phoneNumber,
                    'Phone Number',
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
  void _buildMenu(){
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new Scaffold(
          backgroundColor: new Color.fromRGBO(76, 204, 136, 1.0),
          body: new Center(


              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: <Widget>[

                  new Padding(
                    padding: new EdgeInsets.all(20.0),
                  ),
                  new Flexible(
                    child: new Image.asset('graphics/Capture.png'),
                  ),

                  new Expanded(child:new Row(
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.all(8.0),
                      ),


                      new Expanded(

                        child: new TextField(
                          style: new TextStyle(color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Qanelas',
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left,
                          controller: _controller,

                          decoration: new InputDecoration(
                            hintStyle: new TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 20.0,
                                fontFamily: 'Qanelas',
                                fontStyle: FontStyle.normal),
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
                        shape: new StadiumBorder(),
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(8.0),
                      ),

                    ],

                  ),

                  ),
                  new Flexible(
                    child: new RaisedButton(

                      onPressed: _goToGuidesCreatePage,
                      child: new Text("Be a guide", style: new TextStyle(color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Qanelas',
                          fontWeight: FontWeight.w900),

                      ),
                      color: new Color.fromRGBO(105, 57, 82,1.0),
                      shape: new StadiumBorder(),

                    ),
                  ),

                ],
              )
          ),

        );
      })
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(76, 204, 136, 1.0),
      body: new Center(


          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[

              new Padding(
                padding: new EdgeInsets.all(20.0),
              ),
              new Flexible(
                child: new Image.asset('graphics/Capture.PNG'),
              ),

              new Expanded(child:new Row(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),


                  new Expanded(

                    child: new TextField(
                      style: new TextStyle(color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: 'Qanelas',
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.left,
                      controller: _controller,

                      decoration: new InputDecoration(
                        hintStyle: new TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 20.0,
                            fontFamily: 'Qanelas',
                            fontStyle: FontStyle.normal),
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
                    shape: new StadiumBorder(),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),

                ],

              ),

              ),
              new Flexible(
                child: new RaisedButton(

                  onPressed: _goToGuidesCreatePage,
                  child: new Text("Be a guide", style: new TextStyle(color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Qanelas',
                      fontWeight: FontWeight.w900),

                  ),
                  color: new Color.fromRGBO(105, 57, 82,1.0),
                  shape: new StadiumBorder(),

                ),
              ),

            ],
          )
      ),

    );
  }

}


