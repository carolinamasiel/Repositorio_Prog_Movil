import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:chatscreen_clase/infrastructure/models/message.dart';

class GetYesNoAnswer {
  Future<Message> getAnswer() async {
    final url = Uri.parse('https://yesno.wtf/api');
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      return Message(
        text: 'lo siento',
        fromWho: FromWho.her,
      );
    }

    final data = jsonDecode(resp.body) as Map<String, dynamic>;
    final answer = (data['answer'] ?? '').toString();
    final image = (data['image'] ?? '').toString();

    final text = (answer == 'yes') ? 'Sí' : 'No';

    return Message(
      text: text,
      fromWho: FromWho.her,
      imageUrl: image.isEmpty ? null : image,
    );
  }
}
