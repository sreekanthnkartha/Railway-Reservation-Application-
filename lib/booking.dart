import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservationapp/by.dart';
// import 'package:get/get.dart';
import 'styles.dart';

class Booking extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

DateTime selectedDate = DateTime.now();
String date = "", date2 = "";
TextEditingController _controller3 = TextEditingController(text: "");

class _RegPageState extends State<Booking> {
  final TextEditingController _controller = new TextEditingController();
  bool agree = false;
  toast1(String trainno, String from, String to, String s1, String s2,
          String s3, String s4) =>
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
            "Journey details",
            style: TextStyle(color: Colors.green, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 270,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Train No: $trainno",
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
                Text(
                  "Stations : ",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
                Text(
                  from,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  s1,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  s2,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  s3,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  s4,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  to,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      );
  var locations = [
    'Trivandrum',
    'Kollam',
    'Kayamkulam',
    'Mavelikkara',
    'Chengannur',
    'Thiruvalla',
    'Kottayam',
    'Eranakulam',
    'Aluva',
    'Palakkad',
    'Thrissur'
  ];
  var first = 'Boarding Station';
  String tnoo = "";
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
        var temp = selectedDate.day;
        var temp1 = selectedDate.month;
        var temp2 = selectedDate.year;
        var temp3 = temp.toString();
        var temp4 = temp1.toString();
        if (temp3.length == 1) temp3 = "0" + temp3;
        if (temp4.length == 1) temp4 = "0" + temp4;
        date = temp3 + "/" + temp4 + "/" + temp2.toString();
        _controller3 = TextEditingController(text: date);
        print(date);
        date2 = date[0] + date[1] + date[2] + date[3] + date[4];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Journey Details'),
          backgroundColor: Colors.teal,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
              child: Stack(
            children: <Widget>[
              Image(image: AssetImage('images/train3.jpg'),),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 230),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(23),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'All Fields marked aestriks(*) are mandatory.',
                          style: TextStyle(
                            fontSize: 13, // or whatever
                            color: Colors.red,
                          ),
                        ),
                      ),
                      // myfield("Train Number*", Icons.train_outlined),
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextField(
                              onChanged: (value) {
                                tnoo = value;
                              },
                              style: inputstyle(),
                              decoration: inputdec(
                                  "Train Number*", Icons.train_outlined))),
                      // myfield("Journey Date*", Icons.date_range),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.cyan)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.black)),
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
                              icon: Icon(Icons.calendar_today_outlined),
                              iconSize: 20,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.all(8),
                            isDense: true,
                            hintText: "Journey date"),
                        keyboardType: TextInputType.datetime,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 20),
                      //   child: new Row(
                      //     children: <Widget>[
                      //       new Expanded(
                      //           child: new TextField(
                      //         controller: _controller,
                      //         decoration: InputDecoration(
                      //           fillColor: Colors.white,
                      //           filled: true,
                      //           border: new OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(10.0)),
                      //               borderSide:
                      //                   new BorderSide(color: Colors.black)),
                      //           focusedBorder: new OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(10.0)),
                      //               borderSide:
                      //                   new BorderSide(color: Colors.cyan)),
                      //           enabledBorder: new OutlineInputBorder(
                      //               borderRadius:
                      //                   BorderRadius.all(Radius.circular(10.0)),
                      //               borderSide:
                      //                   new BorderSide(color: Colors.black)),
                      //           errorBorder: InputBorder.none,
                      //           disabledBorder: InputBorder.none,
                      //           hintStyle: TextStyle(
                      //             fontSize: 16,
                      //             color: Colors.grey,
                      //             height: 2.2,
                      //           ),
                      //           prefixIcon: Icon(
                      //             Icons.location_on_outlined,
                      //             size: 20,
                      //             color: Colors.black,
                      //           ),
                      //           contentPadding: EdgeInsets.all(0),
                      //           isDense: true,
                      //           hintText: "Bording Station*",
                      //           suffixIcon: PopupMenuButton<String>(
                      //             icon: const Icon(Icons.arrow_drop_down),
                      //             onSelected: (String value) {
                      //               _controller.text = value;
                      //             },
                      //             itemBuilder: (BuildContext context) {
                      //               return locations.map<PopupMenuItem<String>>(
                      //                   (String value) {
                      //                 return new PopupMenuItem(
                      //                     child: new Text(value), value: value);
                      //               }).toList();
                      //             },
                      //           ),
                      //         ),
                      //       )),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {
                          int f = 0;
                          for (var i in db4) {
                            if (i["tno"] == tnoo) {
                              toast1(i["tno"], i["from"], i["to"], i["s1"],
                                  i["s2"], i["s3"], i["s4"]);
                              f = 1;
                              // toast()i["s1"]
                              break;
                            }
                          }
                          if (f == 0) {
                            toast2();
                          }
                        },
                        //since this is only a UI app
                        child: Text(
                          'GET TRAIN CHART',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        disabledColor: Colors.grey[300],
                        color: Colors.cyan, //Color(0xffff2d55),
                        elevation: 0,
                        minWidth: 400,
                        height: 50,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }

  toast2() => showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          elevation: 3,
          title: Text(
            "Sorry no trains available",
            textAlign: TextAlign.center,
          ),
          content: Icon(
            Icons.remove_circle_outline,
            size: 80,
            color: Colors.red,
          ),
        ),
      );
  myfield(String key, var icn) => Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(style: inputstyle(), decoration: inputdec("$key", icn)));
}
