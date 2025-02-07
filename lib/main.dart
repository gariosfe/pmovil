// Importaciones necesarias
import 'package:firebase_core/firebase_core.dart';       // Firebase Core
import 'package:firebase_messaging/firebase_messaging.dart'; // Notificaciones Push
import 'package:flutter/material.dart';                  // Widgets de Flutter

// Maneja notificaciones recibidas cuando la app está en segundo plano o cerrada
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Notificación recibida en segundo plano: ${message.notification?.title}");
}

// Punto de entrada principal de la aplicación
//El uso de async en void main():
//  Dentro de la función main() estamos realizando operaciones asíncronas 
//  que deben completarse antes de que la aplicación se ejecute.
void main() async {
  // Necesario para inicializar plugins antes de runApp
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar Firebase
  await Firebase.initializeApp();
  
  // Configurar manejador de notificaciones en segundo plano
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  
  // Iniciar la aplicación
  runApp(MyApp());
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(), // Pantalla principal
    );
  }
}

// Pantalla para manejar notificaciones push
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

// Estado de la pantalla de notificaciones
class _NotificationPageState extends State<NotificationPage> {
  String? token; // Almacena el token del dispositivo

  @override
  void initState() {
    super.initState();
    setupPushNotifications(); // Configurar notificaciones al iniciar
  }

  // Configura todo el sistema de notificaciones push
  Future<void> setupPushNotifications() async {
    final messaging = FirebaseMessaging.instance;
    
    // PASO 1: Solicitar permisos al usuario
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,   // Mostrar alertas
      badge: true,   // Mostrar badges
      sound: true,   // Reproducir sonido
    );
    
    // PASO 2: Obtener token único del dispositivo
    token = await messaging.getToken();
    print("Token para enviar notificaciones: $token");
    
    // PASO 3: Configurar manejadores de notificaciones
    
    // Manejador para notificaciones recibidas EN PRIMER PLANO
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Notificación recibida con la app abierta");
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(message.notification?.title ?? 'Sin título'),
          content: Text(message.notification?.body ?? 'Sin contenido'),
        ),
      );
    });

    // Manejador para notificaciones abiertas desde SEGUNDO PLANO
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Usuario abrió la app desde una notificación");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración de Notificaciones"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tu token único del dispositivo:"),
            SizedBox(height: 20),
            // Muestra el token y permite copiarlo
            SelectableText(
              token ?? 'Cargando token...',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}