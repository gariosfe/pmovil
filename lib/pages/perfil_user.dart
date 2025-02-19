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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 61, 77),
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.language, color: Colors.white),
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.add_box_outlined, color: Colors.white),
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 14,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Image
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(Icons.image, color: Colors.grey, size: 50),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[600],
                    child: const Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Profile Info
            Column(
              children: [
                const Text(
                  'Jhon Victor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text('1',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16)),
                        Text('Publicaciones',
                            style: TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: const [
                        Text('3',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16)),
                        Text('Amigos',
                            style: TextStyle(
                                color: Colors.white, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 33, 150, 243),
                      ),
                      onPressed: () {},
                      child: const Text('Configuración'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 76, 175, 80),
                      ),
                      onPressed: () {},
                      child: const Text('Cambiar de perfil'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Tab Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.grid_on, color: Colors.white),
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.play_circle_fill, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Placeholder for Photo Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, color: Colors.grey, size: 50),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
