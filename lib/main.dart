import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'База фитнес центров',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Container(
        child: Text('База фитнес центров home'),),
    );
  }
}

class GymPage extends StatefulWidget {
  const GymPage({Key? key, required this.title}) : super(key: key);


  final String title;


  @override
  State<GymPage> createState() => _GymPageState();
}

class _GymPageState extends State<GymPage> {
  _GymPageState createState()=> _GymPageState();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(),

    );
  }
}




