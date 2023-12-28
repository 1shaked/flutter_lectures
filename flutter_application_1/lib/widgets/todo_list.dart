import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> todos = [
    'TODO - 1',
    'TODO - 2',
    'TODO - 3',
  ];
  String newTodo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New Todo',
              ),
              onChanged: (text) => {
                setState(() {
                  newTodo = text;
                })
              },
            ),
            Text(newTodo),
            Container(
              width: 200,
              height: 200,
              color: Colors.cyanAccent,
              child: ListView.builder(
                itemBuilder: ((context, index) => Row(
                      children: [
                        Text(todos[index]),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                todos.removeAt(index);
                              });
                            },
                            child: Text('delete'))
                      ],
                    )),
                itemCount: todos.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            // $index
            todos.add('todo ➡️ $newTodo');
          })
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
<div>
  p
   div
   p 
   div
<div>
*/