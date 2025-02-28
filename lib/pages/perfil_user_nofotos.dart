// vista del perfil del usuario donde se muestra las publicaciones y los amigos adicional editar y cambiar perfil
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
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  double _buttonScale = 1.0;

  void _onButtonPress() {
    setState(() {
      _buttonScale = 0.95; // Reduce el tamaño del botón al presionar
    });
  }

  void _onButtonRelease() {
    setState(() {
      _buttonScale = 1.0; // Restaura el tamaño del botón al soltar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Parte superior con fondo negro
          Container(
            color: Colors.black,
            child: Column(
              children: [
                // Barra superior
                Container(
                  color: const Color.fromARGB(255, 11, 61, 77),
                  child: SafeArea(
                    child: Container(
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
                  ),
                ),
                // Sección del perfil
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Aquí puedes agregar una acción al tocar la imagen
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Cambia esto por la URL de la imagen del usuario
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Jhon Victor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatColumn('1', 'Publicaciones'),
                    SizedBox(width: 40), // Espacio entre las columnas
                    _buildStatColumn('3', 'Amigos'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGradientButton('Editar perfil'),
                    SizedBox(width: 10),
                    _buildGradientButton('Cambiar de perfil'),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGridIcon(), // Icono de cuadrícula
                    SizedBox(width: 40),
                    _buildPlayIcon(), // Icono de reproducción
                  ],
                ),
                SizedBox(height: 20), // Espacio adicional para separar los íconos del fondo
              ],
            ),
          ),
          // Parte inferior con color plomo oscuro
          Expanded(
            child: Container(
              color: Color(0xFF121212), // Color más oscuro
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Comparte un video',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Crea tu primera publicación',
                        style: TextStyle(color: Colors.teal, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(color: Colors.white, fontSize: 16)),
        Text(label, style: TextStyle(color: Colors.white54, fontSize: 14)),
      ],
    );
  }

  Widget _buildGradientButton(String label) {
    return GestureDetector(
      onTapDown: (_) => _onButtonPress(),
      onTapUp: (_) => _onButtonRelease(),
      onTapCancel: () => _onButtonRelease(),
      child: Transform.scale(
        scale: _buttonScale,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00796B), Color(0xFF2A7A94)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildGridIcon() {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.grid_on, color: Colors.amber, size: 20),
    );
  }

  Widget _buildPlayIcon() {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.play_arrow, color: Colors.teal, size: 20),
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