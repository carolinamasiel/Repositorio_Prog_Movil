import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String text;

  const HerMessageBubble({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 0.72;
    final isGif =
        text.startsWith('http') && text.toLowerCase().contains('.gif');

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFFE1BEE7), // morado suave
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(18),
            ),
          ),
          child: isGif
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    text,
                    fit: BoxFit.cover,
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF4A148C), // morado oscuro
                    fontSize: 15,
                  ),
                ),
        ),
      ),
    );
  }
}
