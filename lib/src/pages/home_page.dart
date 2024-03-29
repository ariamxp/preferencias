import 'package:flutter/material.dart';
import 'package:preferencias/src/shared/preferencias_shared.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new PreferenciasUsuarios();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        title: Text("Prefencias de Usuario"),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario ${ prefs.colorSecundario }'),
          Divider(),
          Text('Genero ${ prefs.genero }'),
          Divider(),
          Text('Nombre de usuario ${ prefs.nombre }'),
          Divider(),
        ],
      ),
    );
  }



}