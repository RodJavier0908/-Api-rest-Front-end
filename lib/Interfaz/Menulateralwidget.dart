import 'package:app_utiapires/Interfaz/configresponse.dart';
import 'package:app_utiapires/Interfaz/de%20Api/Cocteles.dart';
import 'package:app_utiapires/Interfaz/de%20Api/usuariosrandom.dart';
import 'package:app_utiapires/Interfaz/principalwidget.dart';
import 'package:flutter/material.dart';

class Menulateralwidget extends StatefulWidget {
  const Menulateralwidget({super.key});

  @override
  State<Menulateralwidget> createState() => _MenulateralwidgetState();
}

class _MenulateralwidgetState extends State<Menulateralwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(

          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(children: [
                  Icon(Icons.ac_unit, size: 40),
                  Spacer(),
                  if(!responsive.establet(context))CloseButton(),
                ],),
                Padding(padding: EdgeInsets.all(0),
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => principalwidget(),));
                      },
                      child: Padding(padding: EdgeInsets.only(left: 30, right: 30,),
                      child: Card(
                        child: ListTile(
                          title: Text('Inicio'),
                          trailing: Icon(Icons.home),
                        ),
                      ),),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => cotizacionresponse(),));
                      },
                      child: Padding(padding: EdgeInsets.only(left: 30, right: 30,),
                      child: Card(
                        child: ListTile(
                          title: Text('Cotizacion'),
                          trailing: Icon(Icons.money),
                        ),
                      ),),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => usuarioresponse(),));
                      },
                      child: Padding(padding: EdgeInsets.only(left: 30, right: 30,),
                      child: Card(
                        child: ListTile(
                          title: Text('usuarios'),
                          trailing: Icon(Icons.face_2),
                        ),
                      ),),
                    ),
                    SizedBox(height: 5,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => coctelresponse(),));
                      },
                      child: Padding(padding: EdgeInsets.only(left: 30, right: 30,),
                      child: Card(
                        child: ListTile(
                          title: Text('Cocteles'),
                          trailing: Icon(Icons.accessibility),
                        ),
                      )),
                    ),
                  ],
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
