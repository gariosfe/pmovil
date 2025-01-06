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
                      "Create your account - step 1",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF043955),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      focusNode: usernameFocus,
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next, // Permite avanzar al siguiente campo
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      focusNode: firstNameFocus,
                      decoration: InputDecoration(
                        labelText: "First name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next, // Permite avanzar al siguiente campo
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      focusNode: lastNameFocus,
                      decoration: InputDecoration(
                        labelText: "Last name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next, // Permite avanzar al siguiente campo
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _showDatePicker(context),
                      child: AbsorbPointer(
                        child: TextField(
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            labelText: "Birthdate",
                            hintText: selectedDate, // Mostrar la fecha seleccionada
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textInputAction: TextInputAction.done, // Termina el proceso
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
                        labelText: "Gender",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Man",
                          child: Text("Man"),
                        ),
                        DropdownMenuItem(
                          value: "Woman",
                          child: Text("Woman"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      focusNode: locationFocus,
                      decoration: InputDecoration(
                        labelText: "Location",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.done, // Termina el proceso
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
