import 'package:flutter/material.dart';
import 'package:flutter_course/note_app/model/note.dart';
import 'package:flutter_course/note_app/provider/service_provider.dart';
import 'package:flutter_course/note_app/screens/note_editor_screen.dart';
import 'package:flutter_course/note_app/screens/note_search.dart';
import 'package:flutter_course/note_app/service/note_service.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteService noteService = ServiceProvider.of(context)!.noteService;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const NoteSearch(),
              ));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const NoteEditorScreen(),
          ));
        },
        shape: const OvalBorder(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: noteService.getAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            final List<Note> allNotes =
                snapshot.data!.results.map((n) => n).toList();
            return GridView.custom(
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
                childCount: allNotes.length,
                (context, index) => NoteCard(
                  note: allNotes[index],
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => NoteEditorScreen(
                        note: allNotes[index],
                      ),
                    ));
                  },
                ),
              ),
            );
          }),
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
      borderRadius: BorderRadius.circular(10),
      child: Ink(
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
