import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarketplaceScreen(),
    );
  }
}

class MarketplaceScreen extends StatelessWidget {
  final List<Map<String, String>> suggestions = [
    {'image': 'assets/car.jpg', 'price': '\$5000', 'title': 'Vehículo 4x4 JEEP', 'location': 'Cuenca'},
    {'image': 'assets/wine.jpg', 'price': '\$100', 'title': 'Vino Koonunga Hill 2019', 'location': 'Quito'},
    {'image': 'assets/books.jpg', 'price': '\$20', 'title': 'Colección de Poesías', 'location': 'Loja'},
    {'image': 'assets/mug.jpg', 'price': '\$5', 'title': 'Taza Motivacional', 'location': 'Cuenca'},
  ];

  final List<String> carouselImages = [
    'assets/car.jpg',
    'assets/wine.jpg',
    'assets/books.jpg',
    'assets/mug.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Marketplace', style: TextStyle(color: Colors.white)),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 100,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: carouselImages.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Sugerencias', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(suggestions[index]['image']!, fit: BoxFit.cover, width: double.infinity),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(suggestions[index]['price']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(suggestions[index]['title']!),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 14, color: Colors.blue),
                                Text(suggestions[index]['location']!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.language), label: 'Explorar'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Vender'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Tienda'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userCircle), label: 'Perfil'),
        ],
      ),
    );
  }
}
