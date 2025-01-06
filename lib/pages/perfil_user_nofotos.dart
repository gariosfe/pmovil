import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 61, 77),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.language, color: Colors.white),
            SizedBox(width: 20),
            Icon(Icons.add_box, color: Colors.white),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // Sección del perfil alineada a la izquierda
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 20), // Espacio a la izquierda
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jhon Victor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('1', style: TextStyle(color: Colors.white, fontSize: 16)),
                          Text('Publicaciones', style: TextStyle(color: Colors.white54, fontSize: 14)),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Text('3', style: TextStyle(color: Colors.white, fontSize: 16)),
                          Text('Amigos', style: TextStyle(color: Colors.white54, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Editar perfil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                  textStyle: TextStyle(fontSize: 14),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('Cambiar de perfil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800,
                  textStyle: TextStyle(fontSize: 14),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.grid_on, color: Colors.amber, size: 30),
              SizedBox(width: 40),
              Icon(Icons.play_arrow, color: Colors.teal, size: 30),
            ],
          ),
          Expanded(
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
        ],
      ),
    );
  }
}
