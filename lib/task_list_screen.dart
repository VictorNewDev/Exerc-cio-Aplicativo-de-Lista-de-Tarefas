import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(taskData.tasks[index]),
                onDismissed: (direction) {
                  taskData.removeTask(index);
                },
                background: Container(
                  color: Colors.red,
                  child: Icon(Icons.delete, color: Colors.white),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                ),
                child: ListTile(
                  title: Text(taskData.tasks[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTask').then((value) {
            if (value != null && value.toString().isNotEmpty) {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(value.toString());
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
