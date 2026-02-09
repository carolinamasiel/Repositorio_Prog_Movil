import 'dart:convert';

import 'package:chatscreen_clase/infrastructure/models/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJson(String source) =>
      YesNoModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  factory YesNoModel.fromMap(Map<String, dynamic> json) => YesNoModel(
        answer: (json['answer'] ?? '').toString(),
        forced: (json['forced'] ?? false) as bool,
        image: (json['image'] ?? '').toString(),
      );

Message toMessageEntity() => Message(
  text: answer == 'yes' ? 'Sí' : 'No',
  fromWho: FromWho.her,
  imageUrl: image,
);

}
