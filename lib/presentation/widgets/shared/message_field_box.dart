import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void submitValue() {
    final textValue = textController.text.trim();
    if (textValue.isEmpty) return;

    widget.onValue(textValue);
    textController.clear();
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 10),
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        autofocus: true,
        textInputAction: TextInputAction.send,
        onFieldSubmitted: (_) => submitValue(),
        style: const TextStyle(
          color: Color(0xFF4A148C), // texto morado oscuro
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: 'Escribe un mensaje...',
          hintStyle: const TextStyle(
            color: Color(0xFF9575CD), // hint morado suave
          ),
          filled: true,
          fillColor: const Color(0xFFEDE7F6), // fondo morado suave
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 6),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: const Color(0xFF6A1B9A), // botón morado oscuro
              child: IconButton(
                icon: const Icon(Icons.send_rounded),
                color: Colors.white,
                onPressed: submitValue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
