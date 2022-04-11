import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.indigo,
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = [];
  String input = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add("item1");
    todos.add("item1");
    todos.add("item1");
    todos.add("item1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas pendientes'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  elevation: 4.5,
                  margin: const EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                      onPressed: () {
                        
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ));
          }),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    title: const Text('Agregar tarea'),
                    content: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              todos.add(input);
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('Agregar'))
                    ],
                  );
                });
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
    );
  }
}
