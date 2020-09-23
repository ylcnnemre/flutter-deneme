import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yenirehber/Model/Contact.dart';
import 'package:yenirehber/add_contact_page.dart';
import 'package:yenirehber/contact_page.dart';

void main() {
  runApp(myapp());
}

class bekletenislem {
  String Bekleten_islem() {
    sleep(Duration(seconds: 5));
    return "bitti";
  }

  Future<String> yeniislem() {
    return Future.delayed(Duration(seconds: 5), () => "bitti");
  }
}

class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  bool bittimi = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ContactPage());
  }
}
