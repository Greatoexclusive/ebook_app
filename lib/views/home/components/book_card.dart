import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 140,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    "https://cdn.britannica.com/92/211792-050-E764F875/American-singer-Ariana-Grande-2018.jpg"),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.caption("The Tiny Dragon"),
              AppText.headingMeduim(
                "Rupert Carter",
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
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
                  AppText.captionMedium("4.67"),
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
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_outline,
                color: kGreyColor,
              ))
        ],
      ),
    );
  }
}
