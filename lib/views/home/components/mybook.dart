import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:flutter/material.dart';

class MyBookCard extends StatelessWidget {
  const MyBookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 200,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl:
                  "https://cdn.britannica.com/92/211792-050-E764F875/American-singer-Ariana-Grande-2018.jpg"),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.star,
              size: 20,
              color: Colors.yellow,
            ),
            const SizedBox(
              width: 5,
            ),
            AppText.captionMedium("4.67")
          ],
        )
      ]),
    );
  }
}
