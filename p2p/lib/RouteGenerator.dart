import 'package:flutter/material.dart';
import 'package:p2p/pages/home/Layout.dart';
import 'package:p2p/pages/login/Login.dart';
import 'package:p2p/pages/register/Register.dart';

class RouteGenerator {

    /*
     * Função que retorna as rotas geradas
     */
    static Route<dynamic> generateRoute(RouteSettings settings){

        final args = settings.arguments;

        switch(settings.name){
            case '/': 
                return MaterialPageRoute(builder: (_)=> Login());

            case '/home':
                return MaterialPageRoute(builder: (_)=> Layout());

            case '/register':
                return MaterialPageRoute(builder: (_)=> Register(args));

            default:
                return MaterialPageRoute(builder: (_)=> Layout());

        }
    }
}