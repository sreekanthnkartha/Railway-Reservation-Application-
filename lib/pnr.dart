import 'package:flutter/material.dart';
import 'package:reservationapp/styles.dart';

class PNR extends StatefulWidget {
  const PNR({Key? key}) : super(key: key);

  @override
  _PNRState createState() => _PNRState();
}

class _PNRState extends State<PNR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PNR Status"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
            myfield("PNR", Icons.person),
            FlatButton(color: Colors.cyan, onPressed: (){}, child: Icon(Icons.search_rounded,color: Colors.white,))
          ],),
        ),
      ),
    );
  }
}

myfield(String key, var icn) => Container(
    margin: EdgeInsets.only(bottom: 20),
    child: TextField(
        style: inputstyle(),
        onChanged: (val) {
          // uc.reg_data[key] = val;
        },
        decoration: inputdec("$key", icn)));
