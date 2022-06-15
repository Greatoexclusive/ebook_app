import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:ebook_app/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyBookSkeleton extends StatelessWidget {
  const MyBookSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: kSkelenton,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 250, maxWidth: 140),
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
                  child: Skeleton()),
              SizedBox(
                height: 10,
              ),
              SizedBox(width: 140, child: Skeleton())
            ]),
      ),
    );
  }
}
