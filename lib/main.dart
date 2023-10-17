import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> tasks = [];
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joshua Bolito's Todo List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(labelText: 'Add a task'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addTask();
            },
            child: Text('Add Task'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      removeTask(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void addTask() {
    setState(() {
      String newTask = taskController.text;
      if (newTask.isNotEmpty) {
        tasks.add(newTask);
        taskController.clear();
      }
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
}
