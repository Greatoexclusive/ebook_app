import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:flutter/material.dart';

class MyBookCard extends StatelessWidget {
  const MyBookCard({Key? key, required this.image, required this.text})
      : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints(
      //   maxHeight: 250, maxWidth: 140),
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 200,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: image),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 140,
                child: AppText.headingMeduim(
                  text,
                  maxlines: 2,
                  height: 1.1,
                ))
          ]),
    );
  }
}
