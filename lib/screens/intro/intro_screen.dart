import 'package:e_learning_app/util/route_names.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/intro/inside-woman-head-concept-idea-light-bulb-inside-her-mind-illustration-isolated-on-white-vector.jpg"),
          const SizedBox(
            height: 30,
          ),
          Text('Grow ur skills'
          ,style: TextStyle(fontSize: 25,color: Colors.grey.shade900),),
          const SizedBox(
            height: 20,
          ),
          Text('Choose ur favourite course & start learning'
            ,style: TextStyle(fontSize: 27,color: Colors.grey.shade500),),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, RouteNames.courseHome);
          }, child: Text('Getting started'))
        ],
      ),
    );
  }
}
