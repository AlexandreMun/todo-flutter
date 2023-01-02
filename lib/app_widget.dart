import 'package:aula_flutter/pages/home/home_page.dart';
import 'package:aula_flutter/pages/lembretes/lembrete_page.dart';
import 'package:aula_flutter/pages/login/login_page.dart';
import 'package:aula_flutter/pages/splash/splash_page.dart';
import 'package:aula_flutter/pages/usuarios/usuarios_page.dart';
import 'package:aula_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lembretes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.INITIAL: (context) => const SplashPage(),
        Routes.LOGIN: (context) => const LoginPage(),
        Routes.HOME: (context) => const HomePage(),
        Routes.LEMBRETES: (context) => const LembretePage(),
        Routes.USUARIOS: (context) => const UsuariosPage(),
      },
      initialRoute: Routes.INITIAL,
    );
  }
}
