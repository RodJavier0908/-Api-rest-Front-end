import 'dart:convert';
import 'dart:math';
import 'package:app_utiapires/DB/BasedeDatos.dart';
import 'package:app_utiapires/Interfaz/Menulateralwidget.dart';
import 'package:app_utiapires/Interfaz/configresponse.dart';
import 'package:app_utiapires/imagenes/imgcoctel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoctelesWidget extends StatefulWidget {
  @override
  _RandomCocktailWidgetState createState() => _RandomCocktailWidgetState();
}

class _RandomCocktailWidgetState extends State<CoctelesWidget> {

  Map<String, dynamic> cocktail = {};

  Future<void> traercoctel() async {
    final response = await http.get(
        Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        cocktail = data['drinks'][0];
      });
    } else {
      print('Error en la solicitud a la API: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    traercoctel();
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: [
                if(!responsive.establet(context)) IconButton(onPressed: () {
                  _menu.currentState?.openDrawer();
                }, icon: Icon(Icons.menu, size: 30,)),
                Spacer(),
                Text('Cocteles', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),),
                Spacer(),
              ],),
              SizedBox(height: 10,),
              GestureDetector(
                onHorizontalDragCancel: () {
                  traercoctel();
                },
                child: Container(
                  width: 450,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      imgcoctel(),
                      SizedBox(height: 10,),
                      Text(cocktail['strDrink'] ?? '', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                      SizedBox(height: 10,),
                      Container(
                        width: 320,
                        child: Center(
                          child: Column(
                            children: [
                              Text('Instrucciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                              SizedBox(height: 10,),
                              Text(cocktail['strInstructions'] ?? ''),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          /*    Center(
                child: Container(
                  child: Column(
                    children: [
                      FutureBuilder<List<Map<String, dynamic>>>(
                        future: DB.traercoctel(),
                        builder: (context, snapshot) {
                          if(!snapshot.hasData){
                            return const CircularProgressIndicator();
                          }
                          final items = snapshot.data;

                          return Expanded(
                            child: ListView.builder(
                              itemCount: items!.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                final nombre = item['nombre'];
                                final instrucciones = item['instruccion'];
                                final tiempo = item['tiempo'];

                                return Card(
                                  child: ListTile(
                                    title: Text('Nombre: $nombre'),
                                    subtitle: Text('Instrucciones: $instrucciones\nFecha: $tiempo'),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),*/
            ],
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
