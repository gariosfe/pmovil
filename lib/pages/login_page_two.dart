import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateAccountStep1(),
    );
  }
}

class CreateAccountStep1 extends StatefulWidget {
  @override
  _CreateAccountStep1State createState() => _CreateAccountStep1State();
}

class _CreateAccountStep1State extends State<CreateAccountStep1> {
  String? selectedCity;
  String? selectedProvince;

  // Lista completa de provincias y ciudades de Ecuador
  final Map<String, List<String>> provincesAndCities = {
    'Azuay': ['Cuenca', 'Girón', 'Paute', 'Santa Isabel', 'Chordeleg', 'Pucará', 'El Pan'],
    'Bolívar': ['Guaranda', 'Chillanes', 'Echeandía', 'Las Naves', 'San Miguel', 'Chimbo', 'Alpachaca'],
    'Cañar': ['Azogues', 'Biblián', 'La Troncal', 'El Tambo', 'Deleg', 'Suscal', 'Ricaurte'],
    'Carchi': ['Tulcán', 'San Gabriel', 'Espejo', 'Montúfar', 'Huaca', 'Bolívar', 'El Ángel'],
    'Chimborazo': ['Riobamba', 'Alausí', 'Chunchi', 'Colta', 'Guano', 'Macas', 'Culata'],
    'Cotopaxi': ['Latacunga', 'Salcedo', 'Saquisilí', 'Pangua', 'La Maná', 'Sigchos', 'Pujilí'],
    'El Oro': ['Machala', 'Huaquillas', 'Zaruma', 'Piñas', 'Arenillas', 'Las Lajas', 'Balsas'],
    'Esmeraldas': ['Esmeraldas', 'Atacames', 'Muisne', 'Rioverde', 'Eloy Alfaro', 'Tonchigüe', 'Vuelta Larga'],
    'Guayas': ['Guayaquil', 'Durán', 'Samborondón', 'Bajoaguas', 'Milagro', 'Balao', 'Naranjal'],
    'Imbabura': ['Ibarra', 'Otavalo', 'Cotacachi', 'San Miguel de Urcuquí', 'Antonio Ante', 'Pimampiro', 'Lita'],
    'Loja': ['Loja', 'Catamayo', 'Cariamanga', 'Paltas', 'Calvas', 'Cochancay', 'Saraguro'],
    'Los Ríos': ['Babahoyo', 'Quevedo', 'Vinces', 'Montalvo', 'Urdaneta', 'Río Verde', 'Carcelén'],
    'Manabí': ['Portoviejo', 'Manta', 'Chone', 'Jipijapa', 'Pichincha', 'Tosagua', 'El Carmen'],
    'Morona Santiago': ['Macas', 'Sucúa', 'Gualaquiza', 'Llanganates', 'Huamboya', 'Puyo', 'Celiá'],
    'Napo': ['Tena', 'Puerto Misahuallí', 'Archidona', 'Carlos Julio Arosemena Tola', 'Yasuni', 'Río Napo'],
    'Orellana': ['Francisco de Orellana', 'La Joya de los Sachas', 'El Coca', 'Orellana', 'Coca', 'Shushufindi'],
    'Pastaza': ['Puyo', 'Mera', 'Arajuno', 'Santa Clara', 'El Triunfo', 'Lumbaqui', 'Tena'],
    'Pichincha': ['Quito', 'Rumiñahui', 'Mejía', 'Cayambe', 'Puerto Quito', 'Nanegal', 'Tababela'],
    'Tungurahua': ['Ambato', 'Baños', 'Pelileo', 'Cevallos', 'Patate', 'Mocha', 'Totorillas'],
    'Zamora-Chinchipe': ['Zamora', 'Loja', 'Yantzaza', 'Chinchipe', 'Centinela del Cóndor', 'Nangaritza', 'Palanda'],
  };

  List<String> cities = [];

  @override
  void initState() {
    super.initState();
    cities = provincesAndCities['Pichincha']!; // Inicializa las ciudades por defecto (Pichincha)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 61, 77),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Aquí Logo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F7FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Create your account - step 2",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF043955),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Main Address",  // Cambiado de "Main Street" a "Main Address"
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Secondary Address",  // Cambiado de "Secondary Street" a "Secondary Address"
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedProvince,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProvince = newValue;
                          cities = provincesAndCities[newValue!]!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Province",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: provincesAndCities.keys.map((String province) {
                        return DropdownMenuItem<String>(
                          value: province,
                          child: Text(province),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedCity,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCity = newValue;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: cities.map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      // Acción para el botón "Back"
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      // Acción para el botón "Next"
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}