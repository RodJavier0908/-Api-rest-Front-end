import 'package:app_utiapires/Interfaz/Menulateralwidget.dart';
import 'package:app_utiapires/Interfaz/configresponse.dart';
import 'package:flutter/material.dart';

class cuerpowidget extends StatefulWidget {
  const cuerpowidget({super.key});

  @override
  State<cuerpowidget> createState() => _cuerpowidgetState();
}

class _cuerpowidgetState extends State<cuerpowidget> {
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
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if(!responsive.establet(context)) IconButton(onPressed: () {
                        _menu.currentState?.openDrawer();
                      }, icon: Icon(Icons.menu)),

                      Text('MyApp', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),

                      IconButton(onPressed: () {

                      }, icon: Icon(Icons.inbox),)
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
