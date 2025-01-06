import 'package:flutter/material.dart';
import 'package:pmovil/pages/reset_password.dart';
import 'routes.dart';

// Función genérica para obtener los argumentos pasados a una ruta específica
T getArguments<T>(BuildContext context) {
  // Obtiene la ruta actual del contexto y recupera los argumentos asociados a ella.
  // Se asegura de que los argumentos se conviertan al tipo genérico especificado (T).
  return ModalRoute.of(context)!.settings.arguments as T;
}

// Mapa que define las rutas de la aplicación y sus correspondientes widgets (pantallas)
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    // Ruta para la pantalla de bienvenida (SplashScreen)
    Routes.splash: (_) => ResetPasswordPage(),

    // Ruta para la página de inicio de sesión
    Routes.login: (_) => ResetPasswordPage(),

    
  };
}