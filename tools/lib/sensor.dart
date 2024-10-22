import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class BallInHoleGame extends StatefulWidget {
  @override
  _BallInHoleGameState createState() => _BallInHoleGameState();
}

class _BallInHoleGameState extends State<BallInHoleGame> {
  double posX = 0.0, posY = 0.0;
  double ballSize = 30.0;
  double holeSize = 50.0;
  double screenWidth = 0.0, screenHeight = 0.0;
  double holeX = 0.0, holeY = 0.0;
  late StreamSubscription<AccelerometerEvent> _streamSubscription;
  bool gameWon = false;

  @override
  void initState() {
    super.initState();
    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        posX += event.x *
            -1; // Invertir dirección para hacer el movimiento más intuitivo
        posY += event.y;

        // Limitar el movimiento dentro de la pantalla
        if (posX < 0) posX = 0;
        if (posX > screenWidth - ballSize) posX = screenWidth - ballSize;
        if (posY < 0) posY = 0;
        if (posY > screenHeight - ballSize) posY = screenHeight - ballSize;

        // Comprobar si el punto entra en el agujero
        if ((posX - holeX).abs() < (holeSize - ballSize) / 2 &&
            (posY - holeY).abs() < (holeSize - ballSize) / 2) {
          gameWon = true;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        screenWidth = constraints.maxWidth;
        screenHeight = constraints.maxHeight;

        if (holeX == 0 && holeY == 0) {
          holeX = Random().nextDouble() * (screenWidth - holeSize);
          holeY = Random().nextDouble() * (screenHeight - holeSize);
        }

        return Scaffold(
          backgroundColor: Colors.black, // Fondo negro
          body: Stack(
            children: [
              // Agujero
              Positioned(
                left: holeX,
                top: holeY,
                child: Container(
                  width: holeSize,
                  height: holeSize,
                  decoration: BoxDecoration(
                    color: Colors.white, // Agujero blanco
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Punto
              Positioned(
                left: posX,
                top: posY,
                child: Container(
                  width: ballSize,
                  height: ballSize,
                  decoration: BoxDecoration(
                    color: Colors.grey, // Color de la bola en gris
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Mensaje si ganas
              if (gameWon)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¡Ganaste!',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white, // Texto blanco
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Regresar al menú principal
                        },
                        child: Text('Salir'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Botón blanco
                          foregroundColor:
                              Colors.black, // Texto negro del botón
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
