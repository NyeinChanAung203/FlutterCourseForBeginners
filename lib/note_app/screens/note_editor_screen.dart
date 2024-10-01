import 'package:flutter/material.dart';
import 'package:flutter_course/note_app/constants/colors.dart';
import 'package:flutter_course/note_app/model/note.dart';
import 'package:flutter_course/note_app/service/note_service.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({
    super.key,
    this.note,
    required this.noteService,
  });
  final Note? note;
  final NoteService noteService;

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  late Color currentColor;
  late DateTime currentDate;
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.note?.title,
    );
    _contentController = TextEditingController(
      text: widget.note?.content,
    );
    currentDate = widget.note != null ? widget.note!.created : DateTime.now();
    currentColor =
        widget.note != null ? Color(widget.note!.color) : colors.first;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (widget.note != null)
            IconButton(
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Are you sure ?"),
                    content:
                        const Text("Do you really want to delete this note?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("OK")),
                    ],
                  ),
                );

                if (result == true) {
                  widget.noteService.deleteNote(widget.note!);
                  if (context.mounted) {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                }
              },
              icon: const Icon(Icons.delete),
            ),
          IconButton(
            onPressed: () {
              if (_titleController.text.trim().isNotEmpty &&
                  _contentController.text.trim().isNotEmpty) {
                debugPrint("title ${_titleController.text}");
                debugPrint("content ${_contentController.text}");
                late Note note;
                if (widget.note != null) {
                  // update
                  note = Note(
                    widget.note!.id,
                    _titleController.text.trim(),
                    _contentController.text.trim(),
                    DateTime.now(),
                    currentColor.value,
                  );
                  widget.noteService.updateNote(note);
                } else {
                  // add new
                  note = Note(
                    const Uuid().v4(),
                    _titleController.text.trim(),
                    _contentController.text.trim(),
                    DateTime.now(),
                    currentColor.value,
                  );
                  widget.noteService.addNote(note);
                }

                debugPrint(note.toString());
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                maxLines: null,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  border: InputBorder.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  DateFormat.yMMMd().format(currentDate),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                style: const TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: "...",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              splashColor: Colors.black38,
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                setState(() {
                  currentColor = colors[index];
                });
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors[index],
                ),
                width: 48,
                height: 48,
                child: currentColor.value == colors[index].value
                    ? const Icon(Icons.check)
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
