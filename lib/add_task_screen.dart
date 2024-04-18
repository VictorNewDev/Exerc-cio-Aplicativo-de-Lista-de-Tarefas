import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
                Navigator.pop(context, '$title\n$description');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Cor de fundo azul
                onPrimary: Colors.white, // Cor do texto branco
              ),
              child: Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
