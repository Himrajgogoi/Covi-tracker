
import 'package:flutter/material.dart';
import 'package:covid_tracker/Network_checker/Connectivity.dart';
import "package:covid_tracker/pages/Loading.dart";
import "package:covid_tracker/pages/Location.dart";
import "package:covid_tracker/pages/Home.dart";
void main() {
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context)=> Home(),
      "/location": (context)=> Location(),
    }

  ));
}

