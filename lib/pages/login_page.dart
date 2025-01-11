import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pmovil/pages/reset_password.dart';
import 'package:pmovil/pages/routes/routes.dart';
import 'dart:convert';
import 'reset_password.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    final String url = 'http://10.0.2.2:3000/api_red/login';

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _userController.text.trim(),
          'password': _passwordController.text.trim(),
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody['code'] == "COD_OK") {
          if (responseBody['result'] == null) {
            _showMessage(responseBody['info'] ?? 'Credenciales inválidas');
          } else {
            final result = responseBody['result'];
            final String token = result['token'];
            final String username = result['user']['username'];
            final String profilePicture = result['user']['profilePicture'];

            _showMessage('Bienvenido $username');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  token: token,
                  username: username,
                  profilePicture: profilePicture,
                ),
              ),
            );
          }
        } else {
          _showMessage(responseBody['info'] ?? 'Error desconocido.');
        }
      } else if (response.statusCode == 401) {
        final responseBody = jsonDecode(response.body);
        _showMessage(responseBody['info'] ?? 'Credenciales inválidas');
      } else {
        _showMessage('Error del servidor: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showMessage('Error de conexión: $e');
    }
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mensaje'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 11, 61, 77),
              Color.fromARGB(255, 11, 61, 77),
            ],
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comic Sans MS',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.feed);
                          /* if (_userController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            _showMessage('Por favor completa todos los campos');
                          } else {
                            _login();
                          }*/
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account?"),
                    TextButton(
                      onPressed: () {
                        // Redirigir al registro
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                // Enlace para recuperar la contraseña
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String token;
  final String username;
  final String profilePicture;

  const HomePage({
    Key? key,
    required this.token,
    required this.username,
    required this.profilePicture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido, $username',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundImage: NetworkImage(profilePicture),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text('Token: $token'),
          ],
        ),
      ),
    );
  }
}
