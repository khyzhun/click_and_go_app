import 'dart:convert';

import 'package:clickandgoapp/components/ShoppingBottomLayout.dart';
import 'package:clickandgoapp/controllers/PersonDesSer.dart';
import 'package:clickandgoapp/data/models/ShoppingItem.dart';
import 'package:clickandgoapp/data/repository/SharedPref.dart';
import 'package:clickandgoapp/data/repository/ShoppingRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gson/gson.dart';
import 'package:pref_dessert/pref_dessert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => new _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Click&Go | Сканировать",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.menu,
              color: Colors.white,
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 11,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Нажмите,\nчтобы отсканировать\nкод продукта",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 100,
                                child: Material(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(90),
                                  child: InkWell(
                                    onTap: () {
                                      _incrementCounter();
                                    },
                                    borderRadius: BorderRadius.circular(90),
                                    splashColor: Colors.teal,
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      child: Center(
                                        child: Icon(Icons.crop_free,
                                            size: 60, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: ShoppingBottomLayout(price: 0.0))
              ],
            )),
      ),
    );
  }
}


_incrementCounter() async {
//  var dataList = List<ShoppingItem>();
//  var item = ShoppingItem(id: 0, title: "Moloko", price: 35.99, amount: 1, totalPrice: 35.99);
//  dataList.add(item);
//
//  SharedPreferences sp = await SharedPreferences.getInstance();
//  await sp.setString("qwerty", Gson().encode(dataList));

  var item = ShoppingItem(id: 0, title: "Moloko", price: 35.99, amount: 1, totalPrice: 35.99);
  ShoppingRepository repository = ShoppingRepository();
  ShoppingRepository repository2 = ShoppingRepository();
  print("repo == repo2 is: ${repository == repository2}");

  repository.save(item);
}