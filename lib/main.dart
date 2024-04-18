import 'package:flutter/material.dart';
import 'task_list_screen.dart';
import 'add_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Afazeres',
      theme: ThemeData(
        primaryColor:
            Colors.blue, // Definindo a cor azul para a barra de navegação
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.blue, // Definindo a cor azul para a barra de navegação
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TaskListScreen(),
        '/addTask': (context) => AddTaskScreen(),
      },
    );
  }
}
