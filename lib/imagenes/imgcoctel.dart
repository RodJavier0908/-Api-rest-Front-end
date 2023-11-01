import 'package:flutter/material.dart';

class imgcoctel extends StatelessWidget {
  const imgcoctel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 93,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Image.asset('img/coctel.png'),
    );
  }
}
