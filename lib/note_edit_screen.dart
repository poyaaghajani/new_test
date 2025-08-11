import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:new_tset/note_add_screen.dart';

import 'models/note.dart';

class EditNoteScreen extends StatefulWidget {
  final int noteIndex;

  const EditNoteScreen({super.key, required this.noteIndex});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late List<dynamic> _contentList;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    final box = Hive.box<Note>('notes');
    final note = box.getAt(widget.noteIndex)!;
    _contentList = note.content.map((item) {
      if (File(item).existsSync()) {
        return File(item);
      }
      return item;
    }).toList();
    _controllers = _contentList
        .asMap()
        .entries
        .where((entry) => entry.value is String)
        .map((entry) => TextEditingController(text: entry.value))
        .toList();
  }

  // Function to pick an image using file_picker
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true, // Enable multiple image selection
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        for (var file in result.files) {
          if (file.path != null) {
            _contentList.add(File(file.path!));
          }
        }
        _contentList.add('');
        _controllers.add(TextEditingController());
      });
    }
  }

  // Function to remove an image at a specific index
  void _removeImage(int index) {
    setState(() {
      _contentList.removeAt(index);
      // Remove any consecutive empty TextFields that were added as placeholders
      while (index < _contentList.length &&
          _contentList[index] is String &&
          (_contentList[index] as String).isEmpty) {
        _contentList.removeAt(index);
        if (index < _controllers.length) {
          _controllers.removeAt(_getControllerIndex(index));
        }
      }
      // Ensure we don't have more controllers than needed
      while (_controllers.length > _contentList.whereType<String>().length) {
        _controllers.removeLast();
      }
    });
  }

  // Function to save changes to the note
  Future<void> _saveNote() async {
    final box = Hive.box<Note>('notes');
    final contentToSave = _contentList.map<String>((item) {
      if (item is File) {
        return item.path;
      }
      return item as String;
    }).toList();
    await box.putAt(widget.noteIndex, Note(contentToSave));
    Navigator.pop(context);
  }

  // Function to update text at a specific index
  void _updateText(int contentIndex, String text) {
    setState(() {
      _contentList[contentIndex] = text;
    });
  }

  // Get the controller index for a given content index
  int _getControllerIndex(int contentIndex) {
    int controllerIndex = 0;
    for (int i = 0; i < contentIndex; i++) {
      if (_contentList[i] is String) {
        controllerIndex++;
      }
    }
    return controllerIndex;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Header(onImagePressed: _pickImage, onSavePressed: _saveNote),
            SliverFillRemaining(
              hasScrollBody: true,
              child: Container(
                margin: EdgeInsets.only(right: 12, left: 12, bottom: 20),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: _contentList.length,
                  itemBuilder: (context, index) {
                    if (_contentList[index] is String) {
                      final controllerIndex = _getControllerIndex(index);
                      return TextField(
                        controller: _controllers[controllerIndex],
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your text here...',
                        ),
                        onChanged: (text) => _updateText(index, text),
                      );
                    } else if (_contentList[index] is File) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageViewScreen(
                                      imageFile: _contentList[index],
                                    ),
                                  ),
                                );
                              },
                              child: Image.file(
                                _contentList[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _removeImage(index),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.onImagePressed,
    required this.onSavePressed,
  });

  final void Function()? onImagePressed;
  final void Function()? onSavePressed;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        width: double.infinity,
        child: Row(
          children: [
            Text('Edit Note'),
            Spacer(),
            IconButton(onPressed: onImagePressed, icon: Icon(Icons.image)),
            IconButton(onPressed: onSavePressed, icon: Icon(Icons.save)),
          ],
        ),
      ),
    );
  }
}
