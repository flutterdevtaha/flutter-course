import 'package:flutter/material.dart';

import 'notemode.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage(this.noteModel, {Key? key}) : super(key: key);

  final NoteModel noteModel;

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.noteModel.content ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: TextField(
          autofocus: true,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: _controller,
          onSubmitted: (s) {},
          onChanged: (s) {
            widget.noteModel.content = _controller.text;
            debugPrint('s: $s');
          },
        ));
  }
}
