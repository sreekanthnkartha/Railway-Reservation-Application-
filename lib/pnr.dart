import 'package:flutter/material.dart';
import 'package:reservationapp/styles.dart';
import 'by.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PNR extends StatefulWidget {
  const PNR({Key? key}) : super(key: key);

  @override
  _PNRState createState() => _PNRState();
}

class _PNRState extends State<PNR> {
  String mypnr = "";
  int fl = 0;
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
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                      style: inputstyle(),
                      onChanged: (val) {
                        mypnr = val;
                        // uc.reg_data[key] = val;
                      },
                      decoration: inputdec("PNR", Icons.person))),
              FlatButton(
                  color: Colors.cyan,
                  onPressed: () {
                    int f = 0;
                    for (var i in db2) {
                      if (i["pnr"] == mypnr) {
                        f = 1;
                        toast1(
                          i["pnr"],
                          i["tno"],
                          i["date"],
                          i["from"],
                          i["to"],
                        );
                        break;
                      }
                    }
                    if (f == 0) toast2();
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
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Center(
                  child: FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        toast3();
                      },
                      child: Text("Cancel Ticket",
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ),
              ],
            ),
          ),
        ),
      );

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

  toast3() => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
            elevation: 3,
            title: Text(
              "Are you sure you want to cancel?",
              textAlign: TextAlign.center,
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      for (var i in db2) {
                        if (i["pnr"] == mypnr) {
                          db2.remove(i);
                          break;
                        }
                      }
                      fl = 1;
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                          msg: "Cancelled",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blueGrey[100],
                          textColor: Colors.white,
                          fontSize: 16.0);
                      setState(() {});
                    },
                    child: Text("Yes",
                        style: TextStyle(fontSize: 20, color: Colors.white))),
                FlatButton(
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("No",
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ],
            )),
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
