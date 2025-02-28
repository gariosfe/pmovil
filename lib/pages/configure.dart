// configuracion de la cuenta donde estan varios apartados de datos personales, guardado, idiomas y temas tambien el agregar cuenta y cerrar sesion
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
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Barra superior
          Container(
            color: const Color.fromARGB(255, 11, 61, 77),
            child: SafeArea(
              child: Column(
                children: [
                  // Barra de navegación principal
                  Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNavIcon(Icons.home_outlined),
                        _buildNavIcon(Icons.language),
                        _buildAddButton(),
                        _buildMarketplaceIcon(),
                        _buildProfilePicture(),
                        _buildNavIcon(Icons.menu),
                      ],
                    ),
                  ),
                  // Barra de título
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          'Configuración',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Contenido principal
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                // Tu cuenta
                const SectionTitle(title: 'Tu cuenta'),
                _buildListTile(
                  icon: Icons.person,
                  title: 'Configuración básica',
                  subtitle: 'Contraseña, datos personales, correo electrónico',
                  onTap: () {},
                ),
                const Divider(),

                // Cómo usas la aplicación
                const SectionTitle(title: 'Cómo usas la aplicación'),
                _buildListTile(
                  icon: Icons.bookmark,
                  title: 'Guardado',
                  onTap: () {},
                ),
                const Divider(),

                // Contenido multimedia
                const SectionTitle(title: 'Contenido multimedia'),
                _buildListTile(
                  icon: Icons.language,
                  title: 'Idioma',
                  onTap: () {},
                ),
                const Divider(),

                // Temas
                const SectionTitle(title: 'Temas'),
                _buildListTile(
                  icon: Icons.color_lens,
                  title: 'Temas',
                  onTap: () {},
                ),
                const Divider(),

                // Inicio de sesión
                const SizedBox(height: 16),
                _buildListTile(
                  title: 'Agregar cuenta',
                  textColor: Colors.blue,
                  onTap: () {},
                ),
                _buildListTile(
                  title: 'Cerrar sesión',
                  textColor: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    IconData? icon,
    required String title,
    String? subtitle,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: icon != null
          ? Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 11, 61, 77),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon, color: Colors.white, size: 30),
      )
          : null,
      title: Text(
        title,
        style: TextStyle(color: textColor ?? Colors.white, fontSize: 16),
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(color: Colors.grey))
          : null,
      onTap: onTap,
    );
  }

  Widget _buildNavIcon(IconData icon) {
    return Icon(icon, color: Colors.white, size: 24);
  }

  Widget _buildAddButton() {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.add, color: Colors.white, size: 20),
    );
  }

  Widget _buildMarketplaceIcon() {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.store,
        color: Color(0xFF64B5F6),
        size: 24,
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipOval(
        child: Container(
          color: Colors.grey[800],
          child: const Icon(Icons.person, color: Colors.white, size: 20),
        ),
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
          color: Colors.white,
        ),
      ),
    );
  }
}