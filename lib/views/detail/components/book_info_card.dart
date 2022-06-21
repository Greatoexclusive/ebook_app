import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:ebook_app/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class BookInfoCard extends StatelessWidget {
  const BookInfoCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.rating,
      required this.pages,
      required this.date,
      required this.authors})
      : super(key: key);
  final String image;
  final String name;
  final String pages;

  final String date;
  final String rating;
  final List<String> authors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 500,
          width: double.infinity,
          child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: image),
        ),
        Positioned(
          child: Container(
            decoration: const BoxDecoration(),
            clipBehavior: Clip.hardEdge,
            height: 500,
            width: double.infinity - 200,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                height: 500,
                width: double.infinity,
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Center(child: AppText.headingMeduim("Detail Book")),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 15,
          left: MediaQuery.of(context).size.width / 2 - 150,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: -65)
                  ],
                ),
                width: 300,
                child: Image.asset("assets/book.png"),
              ),
            ],
          ),
        ),
        Positioned(
          top: 70,
          left: MediaQuery.of(context).size.width / 2 - 70,
          child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
              width: 130,
              height: 163,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: image,
              )),
        ),
        Positioned(
            top: 300,
            right: 0,
            left: 0,
            child: Center(
                child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: AppText.caption(
                      name,
                      height: 1.1,
                    )),
                authors.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Skeleton(
                          height: 15,
                          width: 150,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            authors.length,
                            (index) => AppText.headingMeduim(
                              "${authors[index]} ${authors.length != 1 ? "," : ""}",
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(25),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          rating == ""
                              ? const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0, top: 2),
                                  child: Skeleton(
                                    height: 15,
                                    width: 20,
                                  ),
                                )
                              : AppText.headingMeduim(rating),
                          AppText.captionMedium("Rating")
                        ],
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.5),
                        width: 1,
                        height: 30,
                      ),
                      Column(
                        children: [
                          pages == ""
                              ? const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0, top: 2),
                                  child: Skeleton(
                                    height: 15,
                                    width: 40,
                                  ),
                                )
                              : AppText.headingMeduim(pages),
                          AppText.captionMedium("No. of pages")
                        ],
                      ),
                      Container(
                        color: Colors.white.withOpacity(0.5),
                        width: 1,
                        height: 30,
                      ),
                      Column(
                        children: [
                          date == ""
                              ? const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0, top: 2),
                                  child: Skeleton(
                                    height: 15,
                                    width: 80,
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width /
                                              4),
                                  child: AppText.headingMeduim(
                                    date,
                                    maxlines: 1,
                                  )),
                          AppText.captionMedium("Published Date")
                        ],
                      )
                    ],
                  ),
                )
              ],
            )))
      ],
    );
  }
}
