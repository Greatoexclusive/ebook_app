import 'package:ebook_app/utils/text.dart';
import 'package:flutter/material.dart';

class GreetingCard extends StatelessWidget {
  const GreetingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.headingMeduim(
              "Good Morning",
              color: Colors.white,
              height: 1,
            ),
            AppText.heading(
              "Great Echidinma",
              height: 1.8,
            )
          ],
        ),
      ),
    );
  }
}
