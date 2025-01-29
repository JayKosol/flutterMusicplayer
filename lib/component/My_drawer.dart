import 'package:flutter/material.dart';
import 'package:fuctest/page/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
                child: Icon(Icons.music_note,
                  size: 40,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              )
          ),

          Padding(
            padding: EdgeInsets.only(top: 25),
            child: ListTile(
                title: Text("H O M E"),
                leading: Icon(Icons.home,),
                onTap: () => Navigator.pop(context),
              )
          ),
          Padding(
              padding: EdgeInsets.only(),
              child: ListTile(
                title: Text("S E T T I N G"),
                leading: Icon(Icons.settings,),
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage())),
              )
          ),
        ],
      ),
    );
  }
}
