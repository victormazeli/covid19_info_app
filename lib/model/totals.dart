import 'dart:io';

import 'package:flutter/foundation.dart';


class GlobalData {
 final bool success;
 final StatsData data;

 GlobalData ({@required this.success, @required this.data});


  factory GlobalData.fromJson(Map<String, dynamic> json) {
    return GlobalData(
    success: json['success'],
    data: StatsData.fromJson(json['data'])
      
      );
  }

}

class StatsData {
  final List<dynamic> stats;

  StatsData({@required this.stats});

   factory StatsData.fromJson(Map<String, dynamic> json) {
    return StatsData(
    stats: json['Stats'],
   
      
      );
  }

}


class WorldData {
 final bool success;
 final GetData data;

 WorldData ({@required this.success, @required this.data});


  factory WorldData.fromJson(Map<String, dynamic> json) {
    return WorldData(
    success: json['success'],
    data: GetData.fromJson(json['data'])
      
      );
  }

}

class GetData {
  final List<DataReport> stats;

  GetData({@required this.stats});

   factory GetData.fromJson(List<dynamic> json) {

     List<DataReport> report = List<DataReport>();
     report = json.map((e) => DataReport.fromJson(e)).toList();

    return GetData(
    
   stats: report,
      
      );
  }

}

class DataReport {
  final String regionName;
  final int cases;
  final int recovered;
  final int deaths;
  final String flagUrl;

  DataReport({
    @required this.regionName,
    @required this.cases,
    @required this.recovered,
    @required this.deaths,
    @required this.flagUrl,
  });

factory DataReport.fromJson(Map<String, dynamic> json) {
  
  return DataReport(
    regionName: json['regionName'], 
    cases: json['casesCount'], 
    recovered: json['recoveredCount'], 
    deaths: json['deceasedCount'], 
    flagUrl: json['regionFlagUrl']
    );
}
  
}