/*import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'get_location.dart';
import 'qr_code_scanner.dart'; // Importar el escáner QR

const _url = 'https://github.com/Lyokone/flutterlocation';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Flutter Location Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Location location = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const GetLocationWidget(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla del escáner de QR
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QrCodeScannerScreen()),
                  );
                },
                child: const Text('Escanear Código QR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'get_location.dart';
import 'qr_code_scanner.dart'; // Importar el escáner QR
import 'sensor.dart'; // Importar el juego de sensor.dart

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Location',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Flutter Aplicacion Multipaquete'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'lib/images/logouni.png', // Coloca el logo de tu universidad aquí
                  height: 100,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Universidad Politecnica de Chiapas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Carrera: Ingeniería en Software',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                'Materia: PROGRAMACIÓN PARA MÓVILES II',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                'Grupo: A',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                'Alumno: José Ángel Nataren Odroñez',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                'Matrícula: 213367',
                style: TextStyle(fontSize: 16),
              ),
              const GetLocationWidget(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla del escáner de QR
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QrCodeScannerScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Escanear Código QR'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navegar al juego Ball in Hole
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BallInHoleGame()), // Llamar al juego
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Jugar Ball in Hole'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
