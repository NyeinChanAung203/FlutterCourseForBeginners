import 'package:flutter/material.dart';
import 'package:flutter_course/note_app/model/note.dart';
import 'package:flutter_course/note_app/provider/service_provider.dart';
import 'package:flutter_course/note_app/screens/note_editor_screen.dart';
import 'package:flutter_course/note_app/screens/note_list_screen.dart';
import 'package:flutter_course/note_app/service/note_service.dart';

class NoteSearch extends StatefulWidget {
  const NoteSearch({
    super.key,
  });

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
    final NoteService noteService = ServiceProvider.of(context)!.noteService;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: "Search",
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
                noteService.searchNote(_controller.text.trim()),
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
                    ),
                  ));
                },
              ),
            ),
    );
  }
}
