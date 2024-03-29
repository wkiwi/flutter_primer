import 'package:flutter/material.dart';
import './demo/listview_demo.dart';
import './demo/hello_demo.dart';
import './demo/drawer_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/material-components.dart';
import './demo/state/state_management_demo.dart';
import './demo/stream/stream_demo.dart';
void main(){
  runApp(
    App()
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:NavigatorDemo(),
      initialRoute: '/stream',
      routes: {
        '/': (context) => Home(),
        '/about':(context) =>Page(title: 'About'),
        '/from':(context) =>FormDemo(),
        '/mdc':(context) =>MaterialComponents(),
        '/state-management':(context) =>StateMangementDemo(),
        '/stream':(context) =>StreamDemo()
      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0)
      ),
    );
  }
}

class Home extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:Text('Wkiwi'),
        // leading: IconButton(
        //   icon:Icon(Icons.menu),
        //   tooltip: 'Navigration',
        //   onPressed: () => debugPrint('Navigration'),
        // ),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => debugPrint('Search'),
          ),
        ],
        elevation: 0.0,
        bottom: TabBar(
          unselectedLabelColor: Colors.black38,
          indicatorColor: Colors.black54,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 1.0,
          tabs: <Widget>[
            Tab(icon:Icon(Icons.local_florist)),
            Tab(icon:Icon(Icons.change_history)),
            Tab(icon:Icon(Icons.directions_bike)),
            Tab(icon:Icon(Icons.view_quilt)),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          // Icon(Icons.local_florist,size: 128.0, color: Colors.black12),
          ListViewDemo(),
          // Icon(Icons.change_history,size: 128.0, color: Colors.black12),
          BasicDemo(),
          // Icon(Icons.directions_bike,size: 128.0, color: Colors.black12),
          LayOutDemo(),

          ViewDemo(),
        ],
      ),
      drawer: DrawerDemo(),
      bottomNavigationBar: BottomNavigationBarDemo()

    ),
    );
  }
}



