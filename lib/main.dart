import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main(){
initFirebase();
runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.amber,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home(),
  },
));}