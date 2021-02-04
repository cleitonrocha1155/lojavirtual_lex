
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtualex/models/user_manager.dart';
import 'package:loja_virtualex/screens/base/base_screen.dart';
import 'package:loja_virtualex/screens/login/login_screen.dart';
import 'package:loja_virtualex/signup/signup_screen.dart';
import 'package:provider/provider.dart';

import 'models/product_manager.dart';


void main() {


  runApp(MyApp());
  //Firestore.instance.collection('teste').add({'teste': 'teste'});



}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        Provider(
          create: (_) => ProductManager(),
          lazy: false,
        )
      ],
      child: MaterialApp(
      title: 'Loja do Renzo ',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primaryColor: const Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/base',
      onGenerateRoute: (settings){
        switch(settings.name){
          case '/login':
            return MaterialPageRoute(
                builder: (_) => LoginScreen()
            );
          case '/signup':
            return MaterialPageRoute(
                builder: (_) => SignUpScreen()
            );
                case '/base':
               default:
            return MaterialPageRoute(
                builder: (_) => BaseScreen()
            );
        }


      }
      ),
    );

  }
}


