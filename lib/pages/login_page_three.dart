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
  // Variables para FocusNode
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  // Variable para controlar si la contraseña está oculta o no
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
                      "Create your account - step 3",
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
                        labelText: "Username",  // Cambiado de "User" a "Username"
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
                      focusNode: emailFocus,
                      decoration: InputDecoration(
                        labelText: "Email Address",  // Cambiado de "Email" a "Email Address"
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      textInputAction: TextInputAction.next, // Permite avanzar al siguiente campo
                    ),
                    const SizedBox(height: 10),
                    // Campo de contraseña con botón para ver/ocultar
                    TextField(
                      focusNode: passwordFocus,
                      obscureText: !_isPasswordVisible, // Controla si la contraseña se ve u oculta
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible; // Alterna el estado de visibilidad
                            });
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.next, // Permite avanzar al siguiente campo
                    ),
                    const SizedBox(height: 10),
                    // Campo de confirmación de contraseña con botón para ver/ocultar
                    TextField(
                      focusNode: confirmPasswordFocus,
                      obscureText: !_isConfirmPasswordVisible, // Controla si la confirmación se ve u oculta
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible; // Alterna el estado de visibilidad
                            });
                          },
                        ),
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
                      backgroundColor: Colors.green,
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
                      "Confirm",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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

