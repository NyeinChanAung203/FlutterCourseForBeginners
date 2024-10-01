import 'package:flutter/material.dart';
import 'package:flutter_course/note_app/model/note.dart';
import 'package:flutter_course/note_app/screens/note_editor_screen.dart';
import 'package:flutter_course/note_app/screens/note_list_screen.dart';
import 'package:flutter_course/note_app/service/note_service.dart';

class NoteSearch extends StatefulWidget {
  const NoteSearch({
    super.key,
    required this.noteService,
  });
  final NoteService noteService;

  @override
  State<NoteSearch> createState() => _NoteSearchState();
}

class _NoteSearchState extends State<NoteSearch> {
  final List<Note> _noteList = [];
  late final TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode()..requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
            ),
            fillColor: Colors.grey.shade900,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _controller.clear();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          onEditingComplete: () {
            setState(() {
              _noteList.clear();
              _noteList.addAll(
                widget.noteService.searchNote(_controller.text.trim()),
              );
            });
          },
        ),
      ),
      body: _noteList.isEmpty
          ? const Center(
              child: Text("No result found"),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: _noteList.length,
              itemBuilder: (context, index) => NoteCard(
                note: _noteList[index],
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => NoteEditorScreen(
                      note: _noteList[index],
                      noteService: widget.noteService,
                    ),
                  ));
                },
              ),
            ),
    );
  }
}
