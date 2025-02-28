// vista para el idioma en este caso solo tenemos dos idiomas que es el español o el ingles
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Configuración de Idioma',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const IdiomaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IdiomaScreen extends StatefulWidget {
  const IdiomaScreen({Key? key}) : super(key: key);

  @override
  _IdiomaScreenState createState() => _IdiomaScreenState();
}

class _IdiomaScreenState extends State<IdiomaScreen> {
  String selectedLanguage = 'Español';

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
                        // Icono de home
                        _buildNavIcon(Icons.home_outlined),
                        // Icono de globo
                        _buildNavIcon(Icons.language),
                        // Botón más
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.add, color: Colors.white, size: 20),
                        ),
                        // Icono de marketplace
                        Container(
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
                        ),
                        // Foto de perfil
                        Container(
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
                        ),
                        // Menú
                        _buildNavIcon(Icons.menu),
                      ],
                    ),
                  ),
                  // Barra de título con botón de retroceso
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
                          'Idioma',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Idioma dentro de la aplicación',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  selectedLanguage,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Divider(color: Colors.grey[800]),
                _buildLanguageOption('Español'),
                _buildLanguageOption('English'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.white,
      size: 24,
    );
  }

  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(
        language,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: selectedLanguage == language
          ? const Icon(Icons.check, color: Color.fromARGB(255, 105, 107, 107))
          : null,
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
    );
  }
}