import 'package:flutter/material.dart';
import "package:http/http.dart" show Response,get;
import "dart:convert";

class Covid {
   Map data;
   int i;
   Map Cntry;
   String g_NewConfirmed;
   String g_TotalConfirmed;
   String g_NewDeaths;
   String g_TotalDeaths;
   String g_NewRecovered;
   String g_TotalRecovered;


   String name;
   int position;
   String Country;
   String NewConfirmed;
   String TotalConfirmed;
   String NewDeaths;
   String TotalDeaths;
   String NewRecovered;
   String TotalRecovered;
   String picture;
   Covid({this.name});
   Future<void> getData() async{
     try{
       Response response = await get("https://api.covid19api.com/summary");
       data = jsonDecode(response.body);
       for (i=0; i<data["Countries"].length; i++){
         if (data["Countries"][i]["Country"] == name){
           Cntry = data["Countries"][i];
         }
       }
       Country = Cntry["Country"];
       TotalConfirmed = Cntry["TotalConfirmed"].toString();
       NewConfirmed = Cntry["NewConfirmed"].toString();
       NewDeaths = Cntry["NewDeaths"].toString();
       TotalDeaths= Cntry["TotalDeaths"].toString();
       NewRecovered = Cntry["NewRecovered"].toString();
       TotalRecovered = Cntry["TotalRecovered"].toString();


       g_NewConfirmed = data["Global"]["NewConfirmed"].toString();
       g_TotalConfirmed = data["Global"]["TotalConfirmed"].toString();
       g_NewDeaths = data["Global"]["NewDeaths"].toString();
       g_TotalDeaths = data["Global"]["TotalDeaths"].toString();
       g_NewRecovered = data["Global"]["NewRecovered"].toString();
       g_TotalRecovered = data["Global"]["TotalRecovered"].toString();

     }
     catch(e){
       print("Error: $e");
     }
}
}