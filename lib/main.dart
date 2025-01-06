import 'package:flutter/material.dart';
import 'package:pmovil/pages/routes/routes.dart';
// import 'pages/login_page.dart';
import 'package:pmovil/pages/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.initialRoute, // Ruta inicial al iniciar la aplicación.
      routes: appRoutes, // Mapa de rutas definido en appRoutes.
    );
  }
}