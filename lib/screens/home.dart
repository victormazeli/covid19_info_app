import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'overview.dart';
import 'search_screen.dart';
import '../providers/total_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

int _selectedIndex = 0;

final List<Widget>_widgetsOption = [
OverviewScreen(),

];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(elevation: 0, actions: <Widget>[IconButton(icon: Icon(Icons.notifications), onPressed: () {})],),
      body: _widgetsOption.elementAt(_selectedIndex),
       
              
      bottomNavigationBar:  BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Theme.of(context).primaryColor,), title: Text('Home', style: TextStyle(color:Theme.of(context).primaryColor ),) ),
        BottomNavigationBarItem(icon: Icon(Icons.info, color: Theme.of(context).primaryColor), title: Text('News', style: TextStyle(color:Theme.of(context).primaryColor ),),  ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Search(),));
      }, child: Icon(Icons.search),  ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

