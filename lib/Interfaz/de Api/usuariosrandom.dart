import 'dart:convert';
import 'package:app_utiapires/DB/BasedeDatos.dart';
import 'package:app_utiapires/Interfaz/Menulateralwidget.dart';
import 'package:app_utiapires/Interfaz/configresponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomUsuariorWidget extends StatefulWidget {
  @override
  _RandomUserWidgetState createState() => _RandomUserWidgetState();
}

class _RandomUserWidgetState extends State<RandomUsuariorWidget> {
  Map<String, dynamic> userData = {};

  Future<void> traerUsuario() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        userData = data['results'][0];
      });
    } else {
      print('Error en la solicitud a la API: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    traerUsuario();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _menu = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _menu,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: Menulateralwidget(),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    if (!responsive.establet(context))
                      IconButton(
                        onPressed: () {
                          _menu.currentState?.openDrawer();
                        },
                        icon: Icon(Icons.menu, size: 30),
                      ),
                    Spacer(),
                    Text(
                      'Usuarios',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                    ),
                    Spacer(),
                  ],
                ),
                Center(
                  child: userData.isEmpty
                      ? CircularProgressIndicator()
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 20),
                      GestureDetector(
                        onDoubleTap: () {
                          traerUsuario();
                        },
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(userData['picture']['large']),
                          radius: 50.0,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        '${userData['name']['first']} ${userData['name']['last']}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '${userData['email']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
