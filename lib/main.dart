import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todo = List();
  String item = "";
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Todo"),
                  content: TextField(
                    onChanged: (String value) {
                      item = value;
                    },
                  ),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            todo.add(item);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.add))
                  ],
                );
              });
        },
        child: Icon(
          Icons.food_bank,
        ),
      ),
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todo[index]),
                child: Card(
                  child: ListTile(
                    title: Text(todo[index]),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          todo.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete_forever),
                      color: Colors.red,
                    ),
                  ),
                ));
          }),
    );
  }
}
