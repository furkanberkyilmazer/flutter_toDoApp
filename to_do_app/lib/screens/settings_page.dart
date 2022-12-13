import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/color_theme_data.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tema Seçimi Yapınız'),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SwitchCard());
  }
}

class SwitchCard extends StatefulWidget {
  const SwitchCard({Key? key}) : super(key: key);

  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {


  Text greenText=Text('Green',style: TextStyle(color:Colors.green));
  Text redText=Text('Red',style: TextStyle(color: Colors.red));

  @override
  Widget build(BuildContext context) {

    bool _value=Provider.of<ColorThemeData>(context).isGreen;
    return Card(
      child: SwitchListTile(
        subtitle:_value?greenText:redText,
        title: Text(
          'Change Theme Color',
          style: TextStyle(color: Colors.black),
        ),
        value: _value,
        onChanged: (bool value) {
          setState(() {
            _value = value;
          });
          Provider.of<ColorThemeData>(context,listen: false).switchTheme(value);
        },
      ),
    );
  }
}
