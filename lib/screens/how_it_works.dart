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
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non auctor tortor, vel molestie neque. Quisque a tellus sed dolor laoreet ultrices. Aliquam erat volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce vel diam gravida augue pharetra ultrices. Quisque tincidunt neque nec fermentum iaculis. Vivamus euismod efficitur diam. Sed sed massa ultrices, porttitor enim a, commodo odio. Maecenas placerat est turpis, a volutpat mi faucibus sed. Pellentesque faucibus, nibh a lacinia accumsan, nibh arcu pretium magna, in dignissim magna nulla pharetra neque. Nullam augue arcu, lobortis nec vehicula vestibulum, fringilla ut eros. In ut lectus arcu. Mauris ac nisl id tortor aliquam ullamcorper. Vivamus quis ultrices erat. Mauris eleifend tristique metus, non accumsan eros efficitur ut. Etiam pellentesque tincidunt posuere.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
