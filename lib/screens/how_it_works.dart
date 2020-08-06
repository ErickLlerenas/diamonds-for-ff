import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HowItWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿Cómo Funciona?'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: SvgPicture.asset('assets/question.svg')),
                  SizedBox(
                    height: 30,
                  ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non auctor tortor, vel molestie neque. Quisque a tellus sed dolor laoreet ultrices. Aliquam erat volutpat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce vel diam gravida augue pharetra ultrices. Quisque tincidunt neque nec fermentum iaculis. Vivamus euismod efficitur diam. Sed sed massa ultrices, porttitor enim a, commodo odio. Maecenas placerat est turpis, a volutpat mi faucibus sed. Pellentesque faucibus, nibh a lacinia accumsan, nibh arcu pretium magna, in dignissim magna nulla pharetra neque. Nullam augue arcu, lobortis nec vehicula vestibulum, fringilla ut eros. In ut lectus arcu. Mauris ac nisl id tortor aliquam ullamcorper. Vivamus quis ultrices erat. Mauris eleifend tristique metus, non accumsan eros efficitur ut. Etiam pellentesque tincidunt posuere.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
