import 'package:ebook_app/utils/text.dart';
import 'package:ebook_app/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({Key? key, required this.description})
      : super(key: key);
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3 - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.left,
              showTrackOnHover: true,
              interactive: true,
              child: ListView(
                padding: const EdgeInsets.only(left: 15, right: 15),
                children: [
                  AppText.headingMeduim("Description"),
                  const SizedBox(
                    height: 10,
                  ),
                  description == ""
                      ? Column(
                          children: [
                            ...List.generate(
                                10,
                                (index) => const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8.0, top: 2),
                                      child: Skeleton(
                                        height: 15,
                                        width: double.infinity,
                                      ),
                                    ))
                          ],
                        )
                      : AppText.captionMedium(description)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
