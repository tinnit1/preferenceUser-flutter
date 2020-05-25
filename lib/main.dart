import 'package:flutter/material.dart';
import 'package:preferenciasuserapp/src/pages/home_page.dart';
import 'package:preferenciasuserapp/src/pages/settings.dart';
import 'package:preferenciasuserapp/src/share_prefs/preferencias_usuario.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias de usuario',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage()
      },
    );
  }
}