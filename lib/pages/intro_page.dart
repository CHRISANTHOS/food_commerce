import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 70, left: 40, right: 40, bottom: 30),
            child: Image.asset('images/foodlogo.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'We deliver to your comfort',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Eat Healthy', style: TextStyle(
            color: Colors.grey[600]
          ),),
          const Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text('Get Started', style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          const Spacer()
        ]),
      ),
    );
  }
}
