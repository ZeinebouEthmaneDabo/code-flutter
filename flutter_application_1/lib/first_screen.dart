import 'package:flutter/material.dart';

class AutreEcran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
      ),
      body: Center(
        child: Text('j ai cree la collection dans firebase mais j n ai pas pu l importer'),
      ),
    );
  }
}
