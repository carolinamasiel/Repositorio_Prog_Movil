import 'package:chatscreen_clase/presentation/screens/chat/her_message_bubble.dart';
import 'package:chatscreen_clase/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chatscreen_clase/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
      leading: Padding(
  padding: const EdgeInsets.all(9.0),
  child: CircleAvatar(
    radius: 20,
    backgroundColor: Colors.grey.shade300,
    child: ClipOval(
      child: Image.network(
        'https://i.pinimg.com/1200x/79/8a/ae/798aae08bcbdfc4c3fe30ed9ad5086c0.jpg',
        width: 40,
        height: 40,
        fit: BoxFit.cover,
       errorBuilder: (context, error, stackTrace) {
  return const Icon(Icons.person);
},

      ),
    ),
  ),
),
        title: const Text('Rapunzel'),
        centerTitle: false,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatefulWidget {
  const _ChatView();

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final List<String> messages = [];
  final ScrollController chatScrollController = ScrollController();

  void moveScrollToBottom() {
    if (!chatScrollController.hasClients) return;

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  void sendMessage(String text) {
    final cleanText = text.trim();
    if (cleanText.isEmpty) return;

    setState(() {
      messages.add(cleanText);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => moveScrollToBottom());
  }

  @override
  void dispose() {
    chatScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? HerMessageBubble(text: messages[index])
                    : MyMessageBubble(text: messages[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: MessageFieldBox(onValue: sendMessage),
          ),
        ],
      ),
    );
  }
}
