import 'package:covid19_info_app/model/totals.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../providers/total_provider.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({
    Key key,
  }) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  Future<GlobalData> getTotal;
  Future<WorldData> getWorldData;
  

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    getTotal = Provider.of<CovidData>(context, listen: false).fetchTotals();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                        Flex(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          direction: Axis.vertical,
                          children: <Widget>[
                            FutureBuilder<GlobalData>(
                            future: getTotal,
                        builder: (context, snapshot) {
                          if ( snapshot.hasData) {
                            return Stack(
                          overflow: Overflow.clip,
                            children: <Widget>[
                              Image(image: AssetImage('assets/images/Rectangle 2.png'), fit: BoxFit.cover,),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                              Text(DateFormat.yMMMMEEEEd().format(DateTime.now()) , style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white)),
                              Text('Corona Virus Cases', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),),
                                      Text('${snapshot.data.data.stats[2]}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white),),
                                ],),
                                ),
  
                              Container(
                                margin: EdgeInsets.only(top: 120),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 20, top: 20),
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.white
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Text('RECOVERED', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, ),),
                                            Text("${snapshot.data.data.stats[3]}", style: TextStyle(fontSize: 23, color: Colors.green, fontWeight: FontWeight.w400, ),),
                                            Expanded(child: Icon(Icons.timeline, size: 52, color: Colors.green,))
                                          ],
                                        ),
                                      ),
                                      Container(
                                      padding: EdgeInsets.only(left: 20, top: 20),
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.white
                                      ),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Text('DEATHS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, ),),
                                            Text("${snapshot.data.data.stats[4]}", style: TextStyle(fontSize: 23, color: Colors.red, fontWeight: FontWeight.w400, ),),
                                            Expanded(child: Icon(Icons.timeline, size: 52, color: Colors.red,))
                                          ],
                                        ),
                                      ),
                              ],
                              ),
                              ), 
                              // Container(
                              //   margin: EdgeInsets.only(top: 290),
                              //   padding: EdgeInsets.symmetric(horizontal: 15),
                                
                              // )

                            ],
                            
                          );
                           } else if (snapshot.hasError) {
                              return Center(child: Text("${snapshot.error}"));
                          }
                          return Center(child: CircularProgressIndicator(), heightFactor: 8.0,);
                        },
                    
                        ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Preventions', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400, ),),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            // width: 250,
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                 Expanded(
                                   flex: 20,
                                    child: Column(children: <Widget>[
                                     CircleAvatar(child: Image(image: AssetImage('assets/images/face-mask.png'),alignment: Alignment.center, fit: BoxFit.cover, ) ,),
                                     SizedBox(height: 5,),
                                     Text('Wear face masks', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),)
                                   ],),
                                 ),

                                  Expanded(
                                    flex: 20,
                                    child: Column(children: <Widget>[
                                     CircleAvatar(child: Image(image: AssetImage('assets/images/cough.png'),alignment: Alignment.center, fit: BoxFit.cover,) ,),
                                     SizedBox(height: 5,),
                                     Text('Cough into your arms', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),)
                                 ],),
                                  ),


                                  Expanded(
                                    flex: 20,
                                  child: Column(children: <Widget>[
                                     CircleAvatar(child: Image(image: AssetImage('assets/images/social-distancing.png'),alignment: Alignment.center, fit: BoxFit.cover,) ,),
                                     SizedBox(height: 5,),
                                     Text('2m social distance', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),)
                                 ],),
                                  ),
                                  
                                ],),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[  
                                     Expanded(
                                       flex: 20,
                                      child: Column(children: <Widget>[
                                       CircleAvatar(child: Image(image: AssetImage('assets/images/washing-hands.png'),alignment: Alignment.center, fit: BoxFit.cover,) ,),
                                       SizedBox(height: 5,),
                                       Text('wash your hands', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),)
                                 ],),
                                     ),

                                    Expanded(
                                      flex: 20,
                                    child: Column(children: <Widget>[
                                       CircleAvatar(child: Image(image: AssetImage('assets/images/antiseptic.png'),alignment: Alignment.center, fit: BoxFit.cover,) ,),
                                       SizedBox(height: 5,),
                                       Text('use alcholic Sanitizers', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),)
                                 ],),
                                    ),
                                    
                                     Expanded(
                                       flex: 20,
                                    child: Column(children: <Widget>[
                                       CircleAvatar(child: Image(image: AssetImage('assets/images/stay-home.png'),alignment: Alignment.center, fit: BoxFit.cover,) ,),
                                       SizedBox(height: 5,),
                                       Text('Stay at home', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),)
                                 ],),
                                     )
                                    
                                    
                                
                                 
                                ],),
                                  ),
                              ],
                            ) ,
                          
                          ),   
                          ],
                          
                        ),
                   ],
                  )
                  );
                         
  }
}


