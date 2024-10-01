import 'package:flutter/material.dart';
import 'package:flutter_course/note_app/model/note.dart';
import 'package:flutter_course/note_app/screens/note_list_screen.dart';
import 'package:flutter_course/note_app/service/note_service.dart';
import 'package:realm/realm.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  late final Realm _realm;
  late final NoteService noteService;

  @override
  void initState() {
    super.initState();
    var config = Configuration.local([Note.schema]);
    _realm = Realm(config);
    noteService = NoteService(_realm);
  }

  @override
  void dispose() {
    _realm.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyNote',
      debugShowCheckedModeBanner: false,
      home: NoteListScreen(
        noteService: noteService,
      ),
      theme: ThemeData.dark(),
    );
  }
}
