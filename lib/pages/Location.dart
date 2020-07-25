import 'package:flutter/material.dart';
import "package:covid_tracker/CovidInfo/Covidclass.dart";

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<Covid> information = [
    Covid(position:76, name: "India", picture: "india.png"),
    Covid(position: 51, name: "Egypt", picture: "egypt.png"),
    Covid(position: 63, name: "Germany", picture: "germany.png"),
    Covid(position: 6, name: "Argentina", picture: "argentina.png"),
    Covid(position: 8, name: "Australia", picture: "Australia.png"),
    Covid(position: 13, name: "Bangladesh", picture: "bangladesh.png"),
    Covid(position: 150, name: "Singapore", picture: "singapore.png"),
    Covid(position: 176, name: "United Kingdom", picture: "uk.png"),
    Covid(position: 177, name: "United States of America", picture: "usa.png")
  ];
  void getInfo(index) async{
    Covid data = information[index];
    await data.getData();
    Navigator.pop((context),{
      "Country": data.Country,
      "NewConfirmed": data.NewConfirmed,
      "TotalConfirmed": data.TotalConfirmed,
      "TotalDeaths": data.TotalDeaths,
      "NewDeaths": data.NewDeaths,
      "NewRecovered": data.NewRecovered,
      "TotalRecovered": data.TotalRecovered
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Country",
        style: TextStyle(
          color: Colors.white
        )),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: information.length,
          itemBuilder: (context,index){
        return Padding(
        padding: EdgeInsets.symmetric(vertical : 10.0, horizontal: 5.0),
         child: Card(
         child: ListTile(
           onTap: (){
             getInfo(index);
           },
           leading: CircleAvatar(
             backgroundImage: AssetImage("assets/${information[index].picture}"),
           ),
           title: Text(information[index].name,
           style: TextStyle(
             fontSize: 20.0
           )),
         )
    )

    );
    }
    )
    );
  }
}
