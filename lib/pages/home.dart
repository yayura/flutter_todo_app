import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userToDo ='';
  List todoList = [];

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initFirebase();
    todoList.addAll(['Example task']);
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
       return Scaffold(
         appBar: AppBar(title: Text('Menu'), backgroundColor: Colors.amberAccent,),
         body: Row(
           children: [
             ElevatedButton(onPressed: (){
               Navigator.pop(context);
               Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
             }, child: Text('Return TO main')),
             Padding(padding: EdgeInsets.only(left:15)),
             Text('Simple menu'),


           ],
         ),
       );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[900],
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('GreenYellowToDolist'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.menu_open_outlined),
            onPressed: _menuOpen,
               ),
        ],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(key: Key(todoList[index]),
            child: Card(
              color: Colors.yellow[200],
              child: ListTile(
                title: Text(todoList[index]),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.greenAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                ),
              ),
            ),
                onDismissed: (direction){
              setState(() {
                todoList.removeAt(index);
              });
              // if(direction ==DismissDirection.startToEnd)
            },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white60,
        child: Icon(
          Icons.add_box,
          color: Colors.greenAccent,
        ),
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              backgroundColor: Colors.yellow[100],
              title: Text('Add element'),
              content: TextField(
                onChanged: (String value){
                  _userToDo=value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    todoList.add(_userToDo);
                  });
                  Navigator.of(context).pop();
                }, child: Text('Add'))
              ],
            );
          });
        }
      ),
    );
  }
}
