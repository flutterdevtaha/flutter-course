import 'dart:convert';

import 'package:flutter/material.dart';

class NoteModel {
  NoteModel({this.content, this.date, this.isChecked, this.decoration});
  String? content;
  String? date;
  bool? isChecked;
  TextDecoration? decoration = TextDecoration.none;

  factory NoteModel.fromJson(Map<String, dynamic> jsonData) {
    return NoteModel(
      content: jsonData['content'],
      date: jsonData['date'],
      isChecked: jsonData['isChecked'],
      decoration: jsonData['decoration'],
    );
  }

  static Map<String, dynamic> toMap(NoteModel note) => {
        'content': note.content,
        'date': note.date,
        'isChecked': note.isChecked,
        'decoration': note.decoration,
      };

  static String encode(List<NoteModel> notes) => json.encode(
        notes
            .map<Map<String, dynamic>>((note) => NoteModel.toMap(note))
            .toList(),
      );

  static List<NoteModel> decode(String notes) =>
      (json.decode(notes) as List<dynamic>)
          .map<NoteModel>((item) => NoteModel.fromJson(item))
          .toList();
}
