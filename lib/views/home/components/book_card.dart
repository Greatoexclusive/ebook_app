import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.image, required this.height})
      : super(key: key);
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: height,
        width: MediaQuery.of(context).size.width / 3,
        child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: image));
  }
}
