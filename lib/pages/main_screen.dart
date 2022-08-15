import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[900],
        appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('GreenYellowToDolist'),
        centerTitle: true,
      ),
    body: Column(
        children:[
          Text('Main Screen', style: TextStyle(color: Colors.white)),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/todo');

          }, child: Text('Перейти далее'))
        ],
       )
    );
  }
}

