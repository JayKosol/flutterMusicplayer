import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuctest/themes/themesprovider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text("S E T T I N G"),backgroundColor: Theme.of(context).colorScheme.primary,),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark mode",style: TextStyle(fontWeight: FontWeight.bold),),
            CupertinoSwitch(
                value: Provider.of<ThemesProvider>(context, listen: false).isDarkMode,
                onChanged: (value)=>Provider.of<ThemesProvider>(context,listen: false).toggleTheme())
          ],
        ),
      ),
    );
  }
}
