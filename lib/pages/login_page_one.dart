// primer paso para crear una cuenta que cuenta con varios campos entre ellos el username, first name, last name, gemder entre otros campos
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
  String? selectedGender;

  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedYear = 2000;

  // Variables para FocusNode
  final FocusNode usernameFocus = FocusNode();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode locationFocus = FocusNode();

  // Variable para almacenar la fecha seleccionada como texto
  String get selectedDate => "$selectedDay/$selectedMonth/$selectedYear";

  // Método para mostrar el picker de fecha
  void _showDatePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 250,
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(initialItem: selectedDay - 1),
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedDay = index + 1;
                        });
                      },
                      children: List<Widget>.generate(31, (int index) {
                        return Center(child: Text((index + 1).toString()));
                      }),
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(initialItem: selectedMonth - 1),
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedMonth = index + 1;
                        });
                      },
                      children: List<Widget>.generate(12, (int index) {
                        return Center(child: Text((index + 1).toString()));
                      }),
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      scrollController: FixedExtentScrollController(initialItem: selectedYear - 1900),
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedYear = 1900 + index;
                        });
                      },
                      children: List<Widget>.generate(150, (int index) {
                        return Center(child: Text((1900 + index).toString()));
                      }),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 11, 61, 77);
    const accentColor = Color(0xFF64B5F6);

    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/img/logo.png', // Ruta de la imagen del logo
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                  const Text(
                  "Crear tu cuenta - paso 1",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  focusNode: usernameFocus,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Nombre de usuario",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                TextField(
                  focusNode: firstNameFocus,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Primer nombre",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                TextField(
                  focusNode: lastNameFocus,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Apellido",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _showDatePicker(context),
                  child: AbsorbPointer(
                    child: TextField(
                      enableInteractiveSelection: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Fecha de nacimiento",
                        hintText: selectedDate,
                        labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.05),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Género",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Hombre",
                    child: Text("Hombre", style: TextStyle(color: Colors.black)),
                  ),
                  DropdownMenuItem(
                    value: "Mujer",
                    child: Text("Mujer", style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                focusNode: locationFocus,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Ubicación",
                  labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                ),
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150, // Ajusta el ancho según sea necesario
                    height: 50, // Aumentar la altura para mayor comodidad
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00796B), Color(0xFF2A7A94)], // Colores más vibrantes
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF00796B).withOpacity(0.5), // Aumentar la opacidad de la sombra
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción para el botón "Atrás"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Atrás",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 150, // Ajusta el ancho según sea necesario
                    height: 50, // Aumentar la altura para mayor comodidad
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00796B), Color(0xFF2A7A94)], // Colores más vibrantes
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF00796B).withOpacity(0.5), // Aumentar la opacidad de la sombra
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción para el botón "Siguiente"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Siguiente",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
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
