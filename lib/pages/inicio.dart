// vista de inicio donde se pueden visualizar todos los post
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
      home: const FeedPage(),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

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
                        _buildNavIcon(Icons.home_outlined), // Icono de inicio
                        _buildNavIcon(Icons.language), // Icono de idioma
                        _buildAddButton(), // Botón de añadir
                        _buildMarketplaceIcon(), // Icono del mercado
                        _buildProfilePicture(), // Imagen de perfil
                        _buildNavIcon(Icons.menu), // Icono de menú
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
                _buildPostCard("youraccount", "Location Here", "Enhance your Instagram with our UI Mockup Download for Instagram creativity.", "12,853 likes", "150 comments"),
                const SizedBox(height: 10),
                _buildPostCard("anotheraccount", "Another Location", "Check out our latest designs and updates!", "5,432 likes", "75 comments"),
                const SizedBox(height: 10),
                _buildPostCard("user123", "Beach Vibes", "Enjoying the sun and sand at the beach!", "8,765 likes", "200 comments"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon) {
    return IconButton(
      icon: Icon(icon, color: Colors.white), // Color blanco para los iconos
      onPressed: () {
        // Acción del icono
      },
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2), // Borde blanco
        borderRadius: BorderRadius.circular(8), // Bordes redondeados
      ),
      child: const Center(
        child: Icon(Icons.add, color: Colors.white), // Icono blanco centrado
      ),
    );
  }

  Widget _buildMarketplaceIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white, // Fondo blanco
        borderRadius: BorderRadius.circular(8), // Bordes redondeados
      ),
      child: const Icon(
        Icons.store,
        color: Colors.blue, // Color azul para el icono del mercado
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2), // Borde blanco
      ),
      child: ClipOval(
        child: Container(
          color: Colors.grey[800],
          child: const Icon(Icons.person, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPostCard(String username, String location, String content, String likes, String comments) {
    return Card(
      color: const Color(0xFF1E1E1E), // Color de fondo del post
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      shadowColor: Colors.black54, // Sombra sutil
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.black), // Icono de usuario
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      location,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 200, // Altura del espacio para la imagen
              decoration: BoxDecoration(
                color: Colors.grey[300], // Color de fondo para el espacio de la imagen
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              child: const Center(
                child: Icon(Icons.image, color: Colors.black, size: 50), // Icono de imagen
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(color: Colors.white), // Color del texto
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red), // Icono de likes
                    const SizedBox(width: 4),
                    Text(likes, style: const TextStyle(color: Colors.grey)),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}