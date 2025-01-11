import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class UsuariosPage extends StatelessWidget {
  // Simulando URLs de imágenes de perfil
  final List<String> profileImageUrls = [
    'https://f.rpp-noticias.io/2019/01/12/738286funfilms-dbsbroly-landing0jpg.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7XaHj8wC5sZMwCvcZk__dCM1B0mOzDWNKSw&s'
  ];

  Future<List<dynamic>> _loadUsuarios() async {
    final String data = await rootBundle.loadString('assets/usuarios.json');
    final Map<String, dynamic> parsedData = json.decode(data);
    return parsedData['usuarios'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Usuarios')),
      body: FutureBuilder(
        future: _loadUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar usuarios.'));
          }
          final List usuarios = snapshot.data!;
          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CachedNetworkImage(
                  imageUrl: profileImageUrls[index % profileImageUrls.length], // Usando URL de perfil
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(usuarios[index]['nombre']),
                subtitle: Text('Edad: ${usuarios[index]['edad']}'),
              );
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UsuariosPage(),
  ));
}
