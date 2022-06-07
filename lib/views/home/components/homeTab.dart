import 'package:ebook_app/utils/text.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: AppText.caption(
        text,
        color: color,
      ),
    );
  }
}
