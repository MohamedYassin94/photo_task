import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
bool isClick = false;
List<String> images =['images/error.png','images/error.png','images/error.png','images/error.png',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Card(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  photo('images/avatar.png'),
                  photo('images/avatar.png'),
                  photo('images/avatar.png'),
                  !isClick ?ElevatedButton(style: ElevatedButton.styleFrom(primary:Colors.deepOrange),onPressed: (){
                    setState(() {
                      isClick = true;
                    });
                  }, child: Text('...'),):
               Container(
                 width: 100,
                 height: 100,
                 child: ListView.builder(
                     itemCount: images.length,
                     scrollDirection: Axis.horizontal,
                     shrinkWrap: true,
                     itemBuilder: (BuildContext context,int index){
                       return photo(images[index]
                       );
                     }
                 ),
               ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget photo(String photo){
    return    Container(
      width: 100,
      height: 100,

      child: new CircleAvatar(
        backgroundColor: Colors.white,
        child: new Image.asset(photo),
      ),
    );
  }
}
