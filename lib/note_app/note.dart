// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  final String id;
  final String title;
  final String content;
  final DateTime created;
  final int color;

  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.created,
    required this.color,
  });

  @override
  String toString() {
    return 'Note(id: $id, title: $title, content: $content, created: $created, color: $color)';
  }

  Note copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? created,
    int? color,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      created: created ?? this.created,
      color: color ?? this.color,
    );
  }
}
