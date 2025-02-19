import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewPostScreen(),
  ));
}

class NewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Nueva Publicación', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IconButton(
              icon: const Icon(Icons.add_photo_alternate, size: 50, color: Colors.grey),
              onPressed: () {},
            ),
            const Text('Agregar foto', style: TextStyle(color: Colors.grey)),
            TextField(decoration: InputDecoration(labelText: 'Título')),
            TextField(decoration: InputDecoration(labelText: 'Precio'), keyboardType: TextInputType.number),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Categoría'),
              items: ['Electrónica', 'Vehículos', 'Hogar'].map((String category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) {},
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Estado'),
              items: ['Nuevo', 'Usado'].map((String state) {
                return DropdownMenuItem(value: state, child: Text(state));
              }).toList(),
              onChanged: (value) {},
            ),
            TextField(decoration: InputDecoration(labelText: 'Descripción (opcional)')),
            TextField(decoration: InputDecoration(labelText: 'Calle principal (opcional)')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Publicar'),
            ),
          ],
        ),
      ),
    );
  }
}