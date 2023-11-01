import 'package:app_utiapires/Interfaz/Menulateralwidget.dart';
import 'package:app_utiapires/Interfaz/configresponse.dart';
import 'package:app_utiapires/Interfaz/cuerpowidget.dart';
import 'package:app_utiapires/Interfaz/de%20Api/Cocteles.dart';
import 'package:app_utiapires/Interfaz/de%20Api/cotizacion.dart';
import 'package:app_utiapires/Interfaz/de%20Api/usuariosrandom.dart';
import 'package:flutter/material.dart';

class principalwidget extends StatefulWidget {
  const principalwidget({super.key});

  @override
  State<principalwidget> createState() => _principalwidgetState();
}

class _principalwidgetState extends State<principalwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: responsive(
          mobil: Row(
            children: [
              Expanded(child: cuerpowidget(), flex: 1,)
            ],
          ),
          tablet: Row(
            children: [
              Expanded(child: Menulateralwidget(), flex: 2,),
              Expanded(child: cuerpowidget(), flex: 3,),
            ],
          )
      ),
    );
  }
}

class coctelresponse extends StatefulWidget {
  const coctelresponse({super.key});

  @override
  State<coctelresponse> createState() => _coctelresponseState();
}

class _coctelresponseState extends State<coctelresponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: responsive(
          mobil: Row(
            children: [
              Expanded(child: CoctelesWidget(), flex: 1,)
            ],
          ),
          tablet: Row(
            children: [
              Expanded(child: Menulateralwidget(), flex: 2,),
              Expanded(child: CoctelesWidget(), flex: 3,),
            ],
          )),
    );
  }
}

class usuarioresponse extends StatefulWidget {
  const usuarioresponse({super.key});

  @override
  State<usuarioresponse> createState() => _usuarioresponseState();
}

class _usuarioresponseState extends State<usuarioresponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: responsive(
          mobil: Row(
            children: [
              Expanded(child: RandomUsuariorWidget(), flex: 1,),

            ],
          ),
          tablet: Row(
            children: [
              Expanded(child: Menulateralwidget(), flex: 2,),
              Expanded(child: RandomUsuariorWidget(), flex: 3,),
            ],
          )),
    );
  }
}

class cotizacionresponse extends StatefulWidget {
  const cotizacionresponse({super.key});

  @override
  State<cotizacionresponse> createState() => _cotizacionresponseState();
}

class _cotizacionresponseState extends State<cotizacionresponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: responsive(
          mobil: Row(
            children: [
              Expanded(child: cotizacionwidget(), flex: 1,)
            ],
          ),
          tablet: Row(
            children: [
              Expanded(child: Container(
                color: Color.fromRGBO(247, 146, 44, 80),
                child: Menulateralwidget(),
              ), flex: 2,),
              Expanded(child: cotizacionwidget(), flex: 3,),
            ],
          )),
    );
  }
}

