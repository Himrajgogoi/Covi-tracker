import 'package:flutter/material.dart';
import "package:covid_tracker/CovidInfo/Covidclass.dart";
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  String NewConfirmed;
  String NewRecovered;
  String NewDeaths;
  String TotalConfirmed;
  String TotalRecovered;
  String TotalDeaths;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data: ModalRoute.of(context).settings.arguments;
    if(data["Country"]==null){
      data["Country"] = "Global";
    }
    else if(data["Country"]=="United States of America"){
      data["Country"] = "USA";
    }
    NewConfirmed = "New Confirmed- " + data["NewConfirmed"];
    TotalConfirmed = "Total Confirmed-" + data["TotalConfirmed"];
    NewRecovered = "New Recovered- " + data["NewRecovered"];
    TotalRecovered = "Total Recovered-" + data["TotalRecovered"];
    NewDeaths = "New Deaths- " + data["NewDeaths"];
    TotalDeaths = "Total Deaths- "+ data["TotalDeaths"];

    print(data);
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              color: Colors.amber,
              onPressed: ()async{
                dynamic result = await Navigator.pushNamed(context, "/location");
                setState(() {
                  data = {
                    "Country": result["Country"],
                    "NewConfirmed": result["NewConfirmed"],
                    "TotalConfirmed": result["TotalConfirmed"],
                    "TotalDeaths": result["TotalDeaths"],
                    "NewDeaths": result["NewDeaths"],
                    "NewRecovered": result["NewRecovered"],
                    "TotalRecovered": result["TotalRecovered"]
                  };
                }
                );
              },
              icon: Icon(
                Icons.edit_location
              ),
              label: Center(
                child: Text("Choose Location",
                style: TextStyle(
                  fontSize: 20.0
                )),
              ),
            ),
            Text(data["Country"],
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )),
            SizedBox(height: 30.0),

                Text("$NewConfirmed",
                style: TextStyle(
    fontSize: 30.0,
                    color: Colors.amberAccent,
                  fontWeight: FontWeight.bold,
    )),SizedBox(height: 8.0),Text("$NewDeaths",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ))
            ,SizedBox(height: 8.0),Text("$NewRecovered",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                )),SizedBox(height: 40.0),
                Text("$TotalConfirmed",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
            SizedBox(height: 8.0),
            Text("$TotalDeaths",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 8.0),
            Text("$TotalRecovered",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ))


          ],
        ),
      )
    );
  }
}
