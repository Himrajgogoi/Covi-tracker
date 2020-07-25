
import 'package:flutter/material.dart';
import "package:covid_tracker/pages/Loading.dart";
import "package:covid_tracker/pages/Location.dart";
import "package:covid_tracker/pages/Home.dart";
void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context)=> Home(),
      "/location": (context)=> Location(),
    }

  ));
}

