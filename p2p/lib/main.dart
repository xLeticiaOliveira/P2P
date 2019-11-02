import 'package:flutter/material.dart';
import 'package:p2p/RouteGenerator.dart';
import 'package:p2p/pages/login/Login.dart';

void main() {
  runApp(new MaterialApp(
    home: new Login(),
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
