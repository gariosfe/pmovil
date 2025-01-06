import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        leading: const Icon(Icons.arrow_back),
        actions: [
          const Icon(Icons.account_circle, size: 32.0),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          // Tu cuenta
          const SectionTitle(title: 'Tu cuenta'),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Configuración básica'),
            subtitle: const Text('Contraseña, datos personales, correo electrónico'),
            onTap: () {},
          ),
          const Divider(),

          // Cómo usas la aplicación
          const SectionTitle(title: 'Cómo usas la aplicación'),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Guardado'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.archive),
            title: const Text('Archivo'),
            onTap: () {},
          ),
          const Divider(),

          // Tu contenido
          const SectionTitle(title: 'Tu contenido'),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacidad de la cuenta'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.block),
            title: const Text('Bloqueados'),
            onTap: () {},
          ),
          const Divider(),

          // Contenido multimedia
          const SectionTitle(title: 'Contenido multimedia'),
          ListTile(
            leading: const Icon(Icons.perm_device_information),
            title: const Text('Permisos del dispositivo'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Idioma'),
            onTap: () {},
          ),
          const Divider(),

          // Inicio de sesión
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Agregar cuenta', style: TextStyle(color: Colors.blue)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Cerrar sesión', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
