import 'package:flutter/material.dart';

class HowItWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Text(
                "¿Cómo funciona?",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Text(
                "Información sobre nuestra app",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Image.asset('assets/question.png')),
              SizedBox(
                height: 30,
              ),
              Text(
                'Genera puntos',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Consigue puntos facilmente en la pantalla de "Ganar". Presiiona el botón de +10 y empieza a acumular puntos.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Recompensa Diaria',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              Text(
                'Cada día tienes la posibilidad de reclamar PUNTOS DIARIOS, se habilitará un botón con la opción de obtener tu recompensa cada vez que este disponible.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              Text(
                'Puntos Obtenidos',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Puedes revisar tu cartera de puntos en la ventana de PUNTOS. Acumula para para conseguir grandes recompensas.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              Text(
                'Gana Premios',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Canjea tus puntos por recompensas en la ventana de PREMIOS. Selecciona la recompensa que deseas canjear, ingresa tu ID de jugador y ¡Listo!, después de un lapso de tiempo tu recompensa será añadida a tu cuenta de FF.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tarjeta Semanal',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              Text(
                'Puedes canjear tus puntos por una tarjeta semanal de FF. Reclama 60 diamantes en juego cada día durante 7 días! ¡Recibirás 420 diamantes en total',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
