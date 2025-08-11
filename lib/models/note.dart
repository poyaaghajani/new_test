import 'package:hive/hive.dart';

part 'note.g.dart'; // For generated adapter

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  List<String> content; // Stores text and image paths

  Note(this.content);
}
