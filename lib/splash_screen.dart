import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart'; // Importa el archivo donde está definido `MyApp`

void main() {
  runApp(const SplashScreenApp());
}

class SplashScreenApp extends StatelessWidget {
  const SplashScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Inicia con el SplashScreen
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AnimatedSplashScreen(
      splash: SizedBox(
        width: screenWidth * 0.7, // Reduce el ancho al 70% del tamaño de la pantalla
        height: screenHeight * 0.7, // Reduce el alto al 70% del tamaño de la pantalla
        child: Lottie.asset(
          'assets/animation/animation.json', // Ruta de la animación
          fit: BoxFit.contain, // Ajusta la animación dentro de los límites del tamaño especificado
        ),
      ),
      nextScreen: const MyApp(), // Navega al widget `MyApp` definido en `main.dart`
      duration: 3500,
      splashIconSize: screenHeight * 0.7, // Ajusta el tamaño del ícono de splash proporcionalmente
      backgroundColor: Colors.white,
    );
  }
}
