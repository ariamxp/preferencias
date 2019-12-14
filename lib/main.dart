import 'package:flutter/material.dart';
import 'package:preferencias/src/pages/home_page.dart';
import 'package:preferencias/src/pages/settings_page.dart';
import 'package:preferencias/src/shared/preferencias_shared.dart';
 
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuarios();
  await prefs.initPrefs();
  runApp(MyApp());

} 
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuarios();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias User',
      initialRoute: prefs.ultimaPagina,
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName     : ( BuildContext context ) => HomePage(),
        SettingsPage.routeName : ( BuildContext context ) => SettingsPage(),
      },
    );
  }
}