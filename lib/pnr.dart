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
      appBar: AppBar(
        title: Text("PNR Status"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myfield("PNR", Icons.person),
              FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    toast1(
                      "123",
                      "456",
                      "12/02/2020",
                      "thrissur",
                      "kollam",
                    );
                  },
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  toast2() => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          elevation: 3,
          title: Text(
            "Sorry you have not booked a ticket",
            textAlign: TextAlign.center,
          ),
          content: Icon(
            Icons.remove_circle_outline,
            size: 80,
            color: Colors.red,
          ),
        ),
      );
  toast1(String pnr, String trainno, String date, String from, String to) =>
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          elevation: 3,
          title: Text(
            "Congrats you have successfully booked a ticket",
            style: TextStyle(color: Colors.green, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "PNR NO: $pnr",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "Train No: $trainno",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "Date: $date",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "From: $from",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "TO: $to",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(height: 20),
                Icon(
                  Icons.check_circle_outline,
                  size: 80,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      );
}

myfield(String key, var icn) => Container(
    margin: EdgeInsets.only(bottom: 20),
    child: TextField(
        style: inputstyle(),
        onChanged: (val) {
          // uc.reg_data[key] = val;
        },
        decoration: inputdec("$key", icn)));
