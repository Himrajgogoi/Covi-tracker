import 'package:flutter/material.dart';
import "package:http/http.dart" show Response,get;
import "dart:convert";

class Covid {
   Map data;

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
   Covid({this.name, this.position, this.picture});
   Future<void> getData() async{
     try{
       Response response = await get("https://api.covid19api.com/summary");
       data = jsonDecode(response.body);
       Country = data["Countries"][position]["Country"];
       TotalConfirmed = data["Countries"][position]["TotalConfirmed"].toString();
       NewConfirmed = data["Countries"][position]["NewConfirmed"].toString();
       NewDeaths = data["Countries"][position]["NewDeaths"].toString();
       TotalDeaths= data["Countries"][position]["TotalDeaths"].toString();
       NewRecovered = data["Countries"][position]["NewRecovered"].toString();
       TotalRecovered = data["Countries"][position]["TotalRecovered"].toString();

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