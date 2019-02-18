import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('wkiwi', style: TextStyle(fontWeight:FontWeight.bold)),
            accountEmail: Text('w_kiwi@163.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/35719531?s=460&v=4'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage('https://avatars3.githubusercontent.com/u/35719531?s=460&v=4'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.yellow[100].withOpacity(0.6), 
                  BlendMode.hardLight)
              )
            ),
          ),
          ListTile(
            title: Text('message', textAlign: TextAlign.right),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
            onTap: ()=> Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: ()=> Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size: 22.0),
            onTap: ()=> Navigator.pop(context),
          ),
        ],
      )
    );
  }
}