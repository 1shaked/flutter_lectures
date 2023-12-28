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

  int selectedIndex = -1;
  String editTodo = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 800,
        height: 900,
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
              width: 400,
              height: 600,
              color: Colors.cyanAccent,
              child: ListView.builder(
                itemBuilder: ((context, index) => SizedBox(
                      width: 100,
                      height: 200,
                      child: selectedIndex != index
                          ? Row(
                              children: [
                                Text(todos[index]),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      todos.removeAt(index);
                                    });
                                  },
                                  child: Text('delete'),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex = index;
                                        editTodo = todos[index];
                                      });
                                    },
                                    child: Icon(Icons.edit))
                              ],
                            )
                          : Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Edited todo',
                                    ),
                                    onChanged: (v) {
                                      setState(() {
                                        editTodo = v;
                                      });
                                    },
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        todos[index] = editTodo;
                                        selectedIndex = -1;
                                      });
                                    },
                                    child: Icon(Icons.save))
                              ],
                            ),
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