import 'package:flutter/material.dart';
import "package:covid_tracker/CovidInfo/Covidclass.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "dart:convert";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async{
    Covid data = Covid(name: "India");
    await data.getData();
    Navigator.pushNamed(context, "/home", arguments: {
      "TotalConfirmed": data.g_TotalConfirmed,
      "NewConfirmed": data.g_NewConfirmed,
      "TotalRecovered": data.g_TotalRecovered,
      "NewRecovered": data.g_TotalRecovered,
      "TotalDeaths": data.g_TotalDeaths,
      "NewDeaths": data.g_NewDeaths,
      "error": data.error
    });
  }
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitFoldingCube(
          size: 60.0,
          color: Colors.white,
        )
      )
    );
  }
}
