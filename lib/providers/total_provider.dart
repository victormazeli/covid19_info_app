import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/totals.dart';


class CovidData with ChangeNotifier{


Future<GlobalData> fetchTotals() async{
  const url = "https://covid-19-global-tracker-with-regional-data.p.rapidapi.com/api/covid/dailyTotals/Global";
  const headers = {
    "x-rapidapi-host": "covid-19-global-tracker-with-regional-data.p.rapidapi.com",
	  "x-rapidapi-key": "ea2b137817msh84666df038e6ebep16b926jsn601305b4594e",
	  "x-authorization": "6179002e-6646-4852-be37-572758a58cbb",
  };
  final response = await http.get(url, headers:headers);

  if (response.statusCode==200) {
    return GlobalData.fromJson(convert.json.decode(response.body));
  } else{
    throw Exception('Faild to load Global Data');
  }
  
 

}

Future<WorldData> globalData() async{
  const url = "https://covid-19-global-tracker-with-regional-data.p.rapidapi.com/api/covid/globalData";
  const headers = {
  "x-rapidapi-host": "covid-19-global-tracker-with-regional-data.p.rapidapi.com",
	"x-rapidapi-key": "ea2b137817msh84666df038e6ebep16b926jsn601305b4594e",
	"x-authorization": "6179002e-6646-4852-be37-572758a58cbb",
  };
  final response = await http.get(url, headers: headers);
    print(response.body);

    if (response.statusCode==200) {
    return WorldData.fromJson(convert.json.decode(response.body));
    } else{
    throw Exception('Faild to load Global Data');
  }
}




}