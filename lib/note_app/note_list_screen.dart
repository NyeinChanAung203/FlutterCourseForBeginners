import 'package:flutter/material.dart';
import 'package:flutter_course/note_app/note.dart';
import 'package:flutter_course/note_app/note_editor_screen.dart';
import 'package:flutter_course/note_app/note_search.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final List<Note> _notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => NoteSearch(notes: _notes),
              ));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Note? note = await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const NoteEditorScreen(),
          ));

          if (note != null) {
            setState(() {
              _notes.add(note);
            });
          }
        },
        shape: const OvalBorder(),
        child: const Icon(Icons.add),
      ),
      body: GridView.custom(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          repeatPattern: QuiltedGridRepeatPattern.same,
          pattern: [
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: _notes.length,
          (context, index) => NoteCard(
            note: _notes[index],
            onTap: () async {
              final Note? note =
                  await Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => NoteEditorScreen(
                  note: _notes[index],
                ),
              ));

              if (note != null) {
                setState(() {
                  final index = _notes.indexWhere((n) => n.id == note.id);
                  _notes[index] = note;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
  });

  final Note note;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                note.title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                DateFormat.yMMMd().format(note.created),
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          )),
    );
  }
}
