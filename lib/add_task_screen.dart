import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController =
      TextEditingController(); // Controlador para a descrição

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título da Tarefa'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descrição da Tarefa'),
              maxLines: 3, // Permitindo múltiplas linhas para a descrição
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text;
                String description = _descriptionController.text;
                if (title.isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(title + '\n' + description);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              child: Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
