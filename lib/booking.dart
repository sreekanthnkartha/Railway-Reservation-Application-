import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'styles.dart';

class Booking extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<Booking> {
  final TextEditingController _controller = new TextEditingController();
  bool agree = false;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Journey Details'),
          backgroundColor: Colors.teal,
        ),
        body: GestureDetector(
          onTap: ()
          {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
              child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1442570468985-f63ed5de9086?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dHJhaW58ZW58MHx8MHx8&w=1000&q=80"),
              // Image(
              //     image: NetworkImage('https://images.firstpost.com/wp-content/uploads/2020/10/train-1280.jpg'),
              //   ),
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
                      myfield("Train Number*", Icons.train_outlined),
                      myfield("Journey Date*", Icons.date_range),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                                child: new TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: new OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        new BorderSide(color: Colors.black)),
                                focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        new BorderSide(color: Colors.cyan)),
                                enabledBorder: new OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide:
                                        new BorderSide(color: Colors.black)),
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  height: 2.2,
                                ),
                                prefixIcon: Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                contentPadding: EdgeInsets.all(0),
                                isDense: true,
                                hintText: "Bording Station*",
                                suffixIcon: PopupMenuButton<String>(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onSelected: (String value) {
                                    _controller.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return locations.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return new PopupMenuItem(
                                          child: new Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {},
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

  myfield(String key, var icn) => Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(style: inputstyle(), decoration: inputdec("$key", icn)));
}
