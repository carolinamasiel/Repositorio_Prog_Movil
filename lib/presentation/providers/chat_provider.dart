import 'package:flutter/material.dart';
import 'package:chatscreen_clase/config/helpers/get_yes_no_answer.dart';
import 'package:chatscreen_clase/infrastructure/models/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final List<Message> messagesList = [
    Message(text: 'Hii', fromWho: FromWho.me),
    Message(text: 'Estas ocupada?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    messagesList.add(newMessage);

    notifyListeners();
    await moveScrollToBottom();

    if (text.trim().endsWith('?')) {
      await herReply();
    }
  }

  Future<void> herReply() async {
    final newMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(newMessage);

    notifyListeners();
    await moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    if (!chatScrollController.hasClients) return;

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
