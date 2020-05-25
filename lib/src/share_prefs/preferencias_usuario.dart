import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }
  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  // get y set del genero
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set setGenero( int value ) {
    _prefs.setInt('genero', value);
  }

  // get y set colorSecundario
  get secundariColor {
    return _prefs.getBool('secundaryColor') ?? false;
  }

  set setsecundariColor( bool value ) {
    _prefs.setBool('secundaryColor', value);
  }

  // get y set nombre usuario
  get userName {
    return _prefs.getString('userName') ?? '';
  }

  set setUserName( String value ) {
    _prefs.setString('userName', value);
  }

  // get y set nombre usuario
  get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set setLastPagee( String value ) {
    _prefs.setString('lastPage', value);
  }
}