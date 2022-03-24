import 'package:flutter/material.dart';
import 'package:todo_example/home/todo_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> openTodos = ["Do my dishes"];
  List<String> finishedTodos = ["Make a great live stream today"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StackStream Todo App"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(labelText: "New Todo"),
                onSubmitted: (String value) {
                  openTodos.add(value);
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => TodoListTile(
                  todo: openTodos[index],
                  callback: () {
                    finishedTodos.add(openTodos[index]);
                    openTodos.removeAt(index);
                    setState(() {});
                  },
                ),
                itemCount: openTodos.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => TodoListTile(
                  todo: finishedTodos[index],
                  callback: () {
                    openTodos.add(finishedTodos[index]);
                    finishedTodos.removeAt(index);
                    setState(() {});
                  },
                ),
                itemCount: finishedTodos.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
