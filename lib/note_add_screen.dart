import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:photo_view/photo_view.dart';

import 'models/note.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final List<dynamic> _contentList = [''];
  final List<TextEditingController> _controllers = [TextEditingController()];
  final List<FocusNode> _focusNodes = [
    FocusNode(),
  ]; // Added for focus management

  // Function to pick an image using file_picker
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
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
        _focusNodes.add(FocusNode());
      });
    }
  }

  // Function to remove an image at a specific index
  void _removeImage(int index) {
    setState(() {
      _contentList.removeAt(index);
      while (index < _contentList.length &&
          _contentList[index] is String &&
          (_contentList[index] as String).isEmpty) {
        _contentList.removeAt(index);
        if (index < _controllers.length) {
          _controllers.removeAt(_getControllerIndex(index));
        }
        if (index < _focusNodes.length) {
          _focusNodes.removeAt(_getControllerIndex(index));
        }
      }
      while (_controllers.length > _contentList.whereType<String>().length) {
        _controllers.removeLast();
        _focusNodes.removeLast();
      }
    });
  }

  // Function to save the note to Hive
  Future<void> _saveNote() async {
    final box = Hive.box<Note>('notes');
    final contentToSave = _contentList.map<String>((item) {
      if (item is File) {
        return item.path;
      }
      return item as String;
    }).toList();
    await box.add(Note(contentToSave));
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
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Unfocus all focus nodes when back is pressed
        for (var focusNode in _focusNodes) {
          focusNode.unfocus();
        }
        return true;
      },
      child: Scaffold(
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
                          focusNode:
                              _focusNodes[controllerIndex], // Assign focus node
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
                                  // Unfocus all focus nodes before navigating
                                  for (var focusNode in _focusNodes) {
                                    focusNode.unfocus();
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImageViewScreen(
                                        imageFile: _contentList[index],
                                      ),
                                    ),
                                  ).then((_) {
                                    // Unfocus all focus nodes when returning
                                    for (var focusNode in _focusNodes) {
                                      focusNode.unfocus();
                                    }
                                  });
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
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
            ),
            Text('Notes'),
            Spacer(),
            IconButton(onPressed: onImagePressed, icon: Icon(Icons.image)),
            IconButton(onPressed: onSavePressed, icon: Icon(Icons.save)),
          ],
        ),
      ),
    );
  }
}

class ImageViewScreen extends StatelessWidget {
  final File imageFile;

  const ImageViewScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image View'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: FileImage(imageFile),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2.0,
          initialScale: PhotoViewComputedScale.contained,
          backgroundDecoration: BoxDecoration(color: Colors.white),
        ),
      ),
    );
  }
}

// class ImageViewScreen extends StatelessWidget {
//   final File imageFile;
//
//   const ImageViewScreen({super.key, required this.imageFile});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image View'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Center(
//         child: PhotoView(
//           imageProvider: FileImage(imageFile),
//           minScale: PhotoViewComputedScale.contained * 0.8,
//           maxScale: PhotoViewComputedScale.covered * 2.0,
//           initialScale: PhotoViewComputedScale.contained,
//           backgroundDecoration: BoxDecoration(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
