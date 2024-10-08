import 'dart:convert';

import 'package:flutter/foundation.dart';

class Question {
  final String question;
  final List<String> options;
  final String answer;

  const Question({
    required this.question,
    required this.options,
    required this.answer,
  });

  @override
  String toString() =>
      'Question(question: $question, options: $options, answer: $answer)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'options': options,
      'answer': answer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] as String,
      options: List<String>.from((map['options'] as List<dynamic>)),
      answer: map['answer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);

  Question copyWith({
    String? question,
    List<String>? options,
    String? answer,
  }) {
    return Question(
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
    );
  }

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        listEquals(other.options, options) &&
        other.answer == answer;
  }

  @override
  int get hashCode => question.hashCode ^ options.hashCode ^ answer.hashCode;
}
