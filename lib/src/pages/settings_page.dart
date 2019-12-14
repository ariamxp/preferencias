import 'package:flutter/material.dart';
import 'package:preferencias/src/shared/preferencias_shared.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textConttroller;

  final prefs = new PreferenciasUsuarios();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textConttroller = new TextEditingController(text: _nombre);
  }

  _setSelectedRadio (int valor) {
    prefs.genero = valor;
    setState(() {
      _genero = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        title: Text("Ajustes"),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Settings', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.grey),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value){
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Maculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _textConttroller,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona que usa el telefono'
              ),
              onChanged: (value){
                setState(() {
                _nombre = value;
                prefs.nombre = value;
              });
              },
            ),
          )
        ],
      ),
    );
  }
}