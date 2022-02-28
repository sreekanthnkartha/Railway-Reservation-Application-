import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservationapp/login.dart';
import 'styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordconController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //call our controller here
  // final uc = Get.put(UserController());
  bool agree = false;

  //UI here
  @override
  Widget build(BuildContext context) {
    toast2(String a) => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            elevation: 3,
            title: Text(
              a,
              textAlign: TextAlign.center,
            ),
            content: Icon(
              Icons.remove_circle_outline,
              size: 80,
              color: Colors.red,
            ),
          ),
        );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Registration"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
                child: Stack(
              children: <Widget>[
                //Now our code is much improved
                CachedNetworkImage(
                    imageUrl:
                        "https://www.wallpapertip.com/wmimgs/174-1749637_dubai-metro.jpg"),
                Container(
                  // width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(23),
                    child: ListView(
                      shrinkWrap:
                          true, //you must add this if you place listview inside scrollview
                      physics:
                          NeverScrollableScrollPhysics(), //to prevent default scrolling of listview
                      children: <Widget>[
                        //Lets define each textfields as functions
                        myfield("email", Icons.mail_outline, _emailController),
                        myfield("name", Icons.person_outline, _nameController),
                        myfield("password", Icons.lock_outline,
                            _passwordController),
                        myfield("Confirm password", Icons.lock_outline,
                            _passwordconController),
                        // myfield("flathouse", Icons.home_outlined),
                        // myfield("area", Icons.location_on_outlined),
                        // myfield("town", Icons.location_on_outlined),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 10),
                        //   child: DropdownButton<String>(
                        //     items: locations.map((String dropdown){
                        //       return DropdownMenuItem<String>(
                        //           value: dropdown,
                        //           child: Text(
                        //             dropdown,
                        //             style: TextStyle(
                        //               fontSize: 18,
                        //                 color: Colors.black
                        //             ),
                        //           )
                        //       );
                        //     }).toList(),
                        //     onChanged: (value){
                        //       setState(() {
                        //         first = value!;
                        //       });
                        //     },
                        //     value: first,
                        //   ),
                        // ),
                        Row(
                          children: [
                            Material(
                              child: Checkbox(
                                value: agree,
                                onChanged: (value) {
                                  setState(() {
                                    agree = value!;
                                    // uc.reg_data["terms_accepted"] = agree;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'I have read and accept terms and conditions',
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        FlatButton(
                          onPressed: () {
                            // Get.toNamed('/terms');
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                    child: Text(
                                  "View Terms and Conditions",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ))
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: agree
                              ? () async {
                                  try {
                                    await _firebaseAuth
                                        .createUserWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text)
                                        .then((value) {
                                      FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc()
                                          .set({
                                        "email": value.user?.email,
                                        "name": _nameController.text,
                                      });
                                    });
                                    Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  } catch (signUpError) {
                                    String aaa;
                                    aaa = signUpError.toString();
                                    int kpp = aaa.lastIndexOf(']') + 1;
                                    toast2(aaa.substring(kpp));
                                  }
                                }
                              : null,
                          //since this is only a UI app
                          child: Text(
                            'REGISTER',
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
                        //obx are used for rendering reactive variables
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        ));
  }

  //You can see code length is reduced
  myfield(String key, var icn, TextEditingController t) => Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
          style: inputstyle(),
          controller: t,
          decoration: inputdec("$key", icn)));
}
