import 'package:flutter/material.dart';
import 'package:food_commerce/pages/intro_page.dart';
import 'package:provider/provider.dart';
import 'package:food_commerce/model/cart_model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartModel>(
      create: (BuildContext context) => CartModel(),
      child: MaterialApp(
        title: 'Food Commerce',
        home: IntroPage(),
      ),
    );
  }
}
