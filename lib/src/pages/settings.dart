import 'package:flutter/material.dart';
import 'package:preferenciasuserapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasuserapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secundaryColor;
  int _genero;
  TextEditingController _textController;
  final prefs = PreferenciasUsuario();
  @override
  void initState() {
    _textController = new TextEditingController(text: prefs.userName);
    _genero = prefs.genero;
    _secundaryColor = prefs.secundariColor;
    prefs.setUserName = SettingsPage.routeName;
    super.initState();
  }

  _setSelectedRadio(int valor) {
    prefs.setGenero = valor;
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: prefs.secundariColor ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _secundaryColor,
                title: Text('Color secundario'),
                onChanged: (value) {
                  _secundaryColor = value;
                  prefs.setsecundariColor = value;
                  setState(() {});
                }),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            RadioListTile(
                value: 2,
                title: Text('Femenino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre de la persona'),
                onChanged: (value) {
                  prefs.setUserName = value;
                },
              ),
            )
          ],
        ));
  }
}
