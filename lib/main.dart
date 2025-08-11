import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_tset/brackets_screen.dart';
import 'package:new_tset/models/note.dart';
import 'package:new_tset/note_add_screen.dart';
import 'package:new_tset/note_edit_screen.dart';
import 'package:new_tset/notes_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => BracketsScreen(),
        '/notes': (context) => NotesScreen(),
        '/add': (context) => AddNoteScreen(),
        '/edit': (context) => EditNoteScreen(
          noteIndex: ModalRoute.of(context)!.settings.arguments as int,
        ),
        '/image': (context) => ImageViewScreen(
          imageFile: ModalRoute.of(context)!.settings.arguments as File,
        ),
      },
    );
  }
}
