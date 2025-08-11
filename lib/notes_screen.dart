import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/note.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  // Improved helper function to check if a string is likely a file path
  bool _isFilePath(String item) {
    final filePathRegex = RegExp(r'^/.*\.[a-zA-Z0-9]+$');
    return filePathRegex.hasMatch(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Notes')),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Note>('notes').listenable(),
        builder: (context, Box<Note> box, _) {
          if (box.isEmpty) {
            return Center(child: Text('No notes yet. Add one!'));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final note = box.getAt(index)!;
              // Aggregate all text items into a single string
              final textItems = note.content
                  .whereType<String>()
                  .where((item) => item.isNotEmpty && !_isFilePath(item))
                  .map((item) => item.trim())
                  .join('\n');
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit', arguments: index);
                },
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (textItems.isNotEmpty)
                          Text(
                            textItems,
                            style: TextStyle(fontSize: 16),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        child: Icon(Icons.add),
      ),
    );
  }
}
