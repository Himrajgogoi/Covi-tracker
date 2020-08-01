import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:covid_tracker/CovidInfo/Covidclass.dart";

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {



  final myController = TextEditingController();

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }


   void getCountry(name) async{
     Covid data = Covid(name: name);

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
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          padding: EdgeInsets.fromLTRB(15.0, 1.0, 15.0, 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.white70,
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 3.0, spreadRadius: 4.0, offset: Offset(4,5))]
          ),

          child: TextField(
          controller: myController,
          decoration: InputDecoration(

              labelText: "Country",
              hintText: "eg. South Africa"
          ),

      ),
        ),

    ]
         ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getCountry(myController.text);

        },
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.search,
          color: Colors.white
        )
      ),
    );
  }
}
