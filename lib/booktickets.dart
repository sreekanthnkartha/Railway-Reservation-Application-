import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:train/variable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:reservationapp/booking.dart';
import 'package:reservationapp/by.dart';
import 'package:reservationapp/pnr.dart';
import 'package:reservationapp/styles.dart';
import 'databasehelper.dart';

class BOOK_TICKETS extends StatefulWidget {
  const BOOK_TICKETS({Key? key}) : super(key: key);

  @override
  _BOOK_TICKETSState createState() => _BOOK_TICKETSState();
}

class _BOOK_TICKETSState extends State<BOOK_TICKETS> {
  @override
  int f = 0;
  String from = "", to = "", date = "",date2="";
  int pid = 8;
  String status = "Not Available";
  DateTime selectedDate = DateTime.now();
  Color satus_col = Colors.white;

  TextEditingController _controller1 = TextEditingController(text: "");
  TextEditingController _controller2 = TextEditingController(text: "");
  TextEditingController _controller3 = TextEditingController(text: "");
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => PNR()));
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Booking()));
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
                                    style: inputstyle(),
                                    onChanged: (value) {
                                      from = value;
                                    },
                                    decoration: inputdec(
                                        "From", Icons.gps_fixed_outlined),
                                    keyboardType: TextInputType.streetAddress,
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
                                    style: inputstyle(),
                                    onChanged: (value) {
                                      to = value;
                                    },
                                    decoration: inputdec(
                                        "To", Icons.location_on_outlined),
                                    keyboardType: TextInputType.streetAddress,
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
                                controller: _controller3,
                                style: inputstyle(),
                              readOnly: true,
                                onChanged: (value) {
                                  // date = value;
                                  selectDate(context);
                                },
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: new OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide:
                                            BorderSide(color: Colors.cyan)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontSize: 16, // or whatever
                                      color: Colors.grey,
                                      height:
                                          2.2, //                                <----- this was the key
                                    ),
                                    prefixIcon: IconButton(
                                      onPressed: () => selectDate(context),
                                      icon:Icon(Icons.calendar_today_outlined),
                                      iconSize: 20,
                                      color: Colors.black,
                                    ),
                                    contentPadding: EdgeInsets.all(8),
                                    isDense: true,
                                    hintText: "DD/MM/YYYY"),
                                keyboardType: TextInputType.datetime,
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
                                color: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () async {
                                  List<Map<String, dynamic>> qrow =
                                      await Databasehelper.instance.sel();
                                  f = 0;
                                  for (var i in db1) {
                                    if (i["from"].toString().toLowerCase() ==
                                            from.toLowerCase() &&
                                        i["to"].toString().toLowerCase() ==
                                            to.toLowerCase() &&
                                        i["date"].toString().contains(date2)) {
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
                                color: Colors.cyan,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () async {
                                  List<Map<String, dynamic>> qrow =
                                      await Databasehelper.instance.sel();
                                  f = 0;
                                  for (var i in db1) {
                                    if (i["from"].toString().toLowerCase() ==
                                            from.toLowerCase() &&
                                        i["to"].toString().toLowerCase() ==
                                            to.toLowerCase() &&
                                        i["date"].toString().contains(date2)) {
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
                                  if (status == "Available") {
                                    for (var i in db1) {
                                      if (i["from"].toString().toLowerCase() ==
                                              from.toLowerCase() &&
                                          i["to"].toString().toLowerCase() ==
                                              to.toLowerCase() &&
                                          i["date"].toString().contains(date2)) {
                                        String pnr = rannum[changer].toString();
                                        changer = (changer + 1) % 13;
                                        db2.add({
                                          'pnr': pnr,
                                          'tno': i["tno"],
                                          'from': i["from"],
                                          'to': i["to"],
                                          'date': date2
                                        });
                                        toast1(
                                          pnr,
                                          i["tno"],
                                          date,
                                          i["from"],
                                          i["to"],
                                        );
                                        break;
                                      }
                                    }
                                    print(db2);
                                  } else if (status == "Not Available")
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

  toast1(String pnr, String trainno, String date, String from, String to) =>
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          actions: [
            TextButton(
              child: Text(
                "Close",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          elevation: 3,
          title: Text(
            "Successfully booked a ticket",
            style: TextStyle(color: Colors.green, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 250,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 80,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        var temp=selectedDate.day;
        var temp1=selectedDate.month;
        var temp2=selectedDate.year;
        var temp3=temp.toString();
        var temp4=temp1.toString();
        if(temp3.length==1)
        temp3="0"+temp3;
        if(temp4.length==1)
        temp4="0"+temp4;
        date = temp3+"/"+temp4+"/"+temp2.toString();
        _controller3=TextEditingController(text: date);
        print(date);
        date2=date[0]+date[1]+date[2]+date[3]+date[4];
      });
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
