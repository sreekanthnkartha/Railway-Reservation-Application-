import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:reservationapp/booktickets.dart';
import 'package:reservationapp/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(1), BlendMode.dstATop),
          image: AssetImage("images/logo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 470,
          ),
          // Image(image: AssetImage("images/logo2.png"),),
          // Text("League El"),
          SizedBox(
            height: 20,
          ),
          SpinKitDoubleBounce(
            color: Colors.white70,
            size: 80.0,
          )
        ],
      ),
    ));
  }
}
