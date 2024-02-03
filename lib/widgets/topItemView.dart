import 'package:flutter/material.dart';

class TopItemView extends StatelessWidget {
  final String title;
  final String text;
  final String subText;
  final CrossAxisAlignment crossAxisAlignment;
  const TopItemView({
    super.key,
    required this.title,
    required this.text,
    required this.subText,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        topTitleView(title),
        topContentView(text, subText),
      ],
    );
  }

  Widget topTitleView(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget topContentView(String text, String subtext) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 35,
        ),
        children: [
          TextSpan(
            text: subtext,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
