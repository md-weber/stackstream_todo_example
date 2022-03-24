import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final String todo;
  final VoidCallback callback;

  const TodoListTile({required this.todo, required this.callback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: callback,
      title: Text(todo),
      leading: Checkbox(
        value: false,
        onChanged: (bool? value) {
          callback();
        },
      ),
    );
  }
}
