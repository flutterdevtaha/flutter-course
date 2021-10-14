
import 'package:contacts_01/todo_shared_prefrences_task/noteapp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const NoteApp(),
    );
  }
}
