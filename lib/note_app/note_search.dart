import 'package:flutter/material.dart';
import 'package:flutter_course/note_app/note.dart';
import 'package:flutter_course/note_app/note_editor_screen.dart';
import 'package:flutter_course/note_app/note_list_screen.dart';

class NoteSearch extends StatefulWidget {
  const NoteSearch({super.key, required this.notes});

  final List<Note> notes;

  @override
  State<NoteSearch> createState() => _NoteSearchState();
}

class _NoteSearchState extends State<NoteSearch> {
  List<Note> _noteList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              _noteList = widget.notes
                  .where((n) =>
                      n.title.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          },
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: _noteList.length,
        itemBuilder: (context, index) => NoteCard(
          note: _noteList[index],
          onTap: () async {
            final Note? note =
                await Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => NoteEditorScreen(
                note: _noteList[index],
              ),
            ));

            if (note != null) {
              setState(() {
                final index = _noteList.indexWhere((n) => n.id == note.id);
                _noteList[index] = note;
              });
            }
          },
        ),
      ),
    );
  }
}
