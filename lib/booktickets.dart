import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:train/variable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reservationapp/booking.dart';
import 'package:reservationapp/by.dart';
import 'package:reservationapp/pnr.dart';
import 'databasehelper.dart';

class BOOK_TICKETS extends StatefulWidget {
  const BOOK_TICKETS({Key? key}) : super(key: key);

  @override
  _BOOK_TICKETSState createState() => _BOOK_TICKETSState();
}

class _BOOK_TICKETSState extends State<BOOK_TICKETS> {
  @override
  String from = "", to = "", date = "";
  int pid = 8;
  String status = "";
  Color satus_col = Colors.white;

  TextEditingController _controller1 = TextEditingController(text: "");
  TextEditingController _controller2 = TextEditingController(text: "");
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        elevation: 0,
        title: Text(
          "BOOK TICKETS",
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              // fontSize: 30,
              color: Colors.white),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Stack(
                children: [
                  Image(
                    fit: BoxFit.cover,
                    height: 250,
                    image: NetworkImage(
                        "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2021/12/08/1008897-indian-railway-irctc.jpg"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton(
                                  color: Colors.cyan,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {

                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PNR()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.bookmark_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "PNR STATUS",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )),
                              FlatButton(
                                  color: Colors.cyan,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Booking()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.bar_chart_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "CHARTS/VACANCY",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: _controller1,
                                    onChanged: (value) {
                                      from = value;
                                    },
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.gps_fixed_outlined),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: "Starting Point",
                                        hintText: "From"),
                                    keyboardType: TextInputType.streetAddress,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  String temp = from;
                                  from = to;
                                  to = temp;
                                  _controller1 =
                                      TextEditingController(text: from);
                                  _controller2 =
                                      TextEditingController(text: to);
                                });
                              },
                              icon: Icon(
                                Icons.swap_vertical_circle,
                                size: 35,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: _controller2,
                                    onChanged: (value) {
                                      to = value;
                                    },
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.location_on_outlined),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: "Destination",
                                        hintText: 'To'),
                                    keyboardType: TextInputType.streetAddress,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                onChanged: (value) {
                                  date = value;
                                },
                                decoration: InputDecoration(
                                    icon: Icon(Icons.calendar_today_outlined),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelText: "Date",
                                    hintText: "DD/MM/YYYY"),
                                keyboardType: TextInputType.datetime,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () async {
                                  List<Map<String, dynamic>> qrow =
                                      await Databasehelper.instance.sel();
                                  int f = 0;
                                  for (var i in db1) {
                                     if (i["from"].toString().toLowerCase() == from.toLowerCase() && i["to"].toString().toLowerCase() == to.toLowerCase() && i["date"].toString().contains(date)) {
                                      status = "Available";
                                      satus_col = Colors.green;
                                      print(i);
                                      f = 1;
                                      break;
                                    }
                                  }
                                  if (f == 0 && status != "") {
                                    status = "Not Available";
                                    satus_col = Colors.red;
                                  }
                                  Fluttertoast.showToast(
                                      msg: status,
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: (status != "")
                                          ? Colors.blueGrey[100]
                                          : Colors.transparent,
                                      textColor: satus_col,
                                      fontSize: 16.0);
                                  setState(() {});
                                },
                                child: Text(
                                  "CHECK",
                                  style: TextStyle(color: Colors.white),
                                )),
                            FlatButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () async {
                                  List<Map<String, dynamic>> qrow =
                                      await Databasehelper.instance.sel();
                                  int f = 0;
                                  for (var i in db1) {
                                    if (i["from"].toString().toLowerCase() == from.toLowerCase() && i["to"].toString().toLowerCase() == to.toLowerCase() && i["date"].toString().contains(date)) {
                                      status = "Available";
                                      satus_col = Colors.green;
                                      print(i);
                                      f = 1;
                                      break;
                                    }
                                  }
                                  if (f == 0 && status != "") {
                                    status = "Not Available";
                                    satus_col = Colors.red;
                                  }
                                  if (status == "Available")
                                    {
                                      showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        elevation: 3,
                                        title: Text(
                                          "SUCCESSFUL",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Icon(
                                          Icons.check_circle_outline_rounded,
                                          size: 80,
                                          color: Colors.green,
                                        ),
                                        // actions: <Widget>[
                                        //   FlatButton(
                                        //     onPressed: () {
                                        //       Navigator.of(ctx).pop();
                                        //     },
                                        //     child: Text("okay"),
                                        //   ),
                                        // ],
                                      ),
                                    );
                                    for (var i in db1) {
                                     if (i["from"].toString().toLowerCase() == from.toLowerCase() && i["to"].toString().toLowerCase() == to.toLowerCase() && i["date"].toString().contains(date)) {
                                      String pnr="PNR"+givingno.toString();
                                      givingno++;
                                      db2.add( {'pnr':pnr,'tno':i["tno"],'from': i["from"], 'to': i["to"], 'date': i["date"]});
                                      break;
                                    }
                                  }
                                  print(db2);
                                    }
                                  else if (status == "Not Available")
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        elevation: 3,
                                        title: Text(
                                          "NO TRAINS AVAILABLE",
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Icon(
                                          Icons.close_rounded,
                                          size: 80,
                                          color: Colors.red,
                                        ),
                                        // actions: <Widget>[
                                        //   FlatButton(
                                        //     onPressed: () {
                                        //       Navigator.of(ctx).pop();
                                        //     },
                                        //     child: Text("okay"),
                                        //   ),
                                        // ],
                                      ),
                                    );
                                  setState(() {});
                                },
                                child: Text(
                                  "BOOK",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                        // FlatButton(
                        //     onPressed: () async {
                        //       int y = await Databasehelper.instance.insert(
                        //           {'_id': pid, 'name': from, 'name2': to});
                        //       pid++;
                        //       print(y);
                        //     },
                        //     child: Text("insert")),
                        // FlatButton(
                        //     onPressed: () async {
                        //       List<Map<String, dynamic>> qrow =
                        //           await Databasehelper.instance.sel();
                        //       print(qrow);
                        //     },
                        //     child: Text("print")),
                        // FlatButton(
                        //     onPressed: () async {
                        //       int rowaff = await Databasehelper.instance.del(2);
                        //       print(rowaff);
                        //     },
                        //     child: Text("delete")),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

Widget Buttu2(String ttt, Color clr, IconData y, {Color tc = Colors.white}) {
  return FlatButton(
      color: clr,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            y,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            ttt,
            style: TextStyle(color: tc),
          ),
        ],
      ));
}
