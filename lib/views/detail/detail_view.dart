import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBgColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: double.infinity,
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://cdn.britannica.com/92/211792-050-E764F875/American-singer-Ariana-Grande-2018.jpg"),
                  ),
                  Positioned(
                    child: Container(
                      decoration: const BoxDecoration(),
                      clipBehavior: Clip.hardEdge,
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: double.infinity - 200,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          width: double.infinity,
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
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
                    top: 50,
                    left: 0,
                    right: 0,
                    // left: MediaQuery.of(context).size.width / 2 - 40,
                    child: Center(child: AppText.headingMeduim("Detail Book")),
                  ),
                  Positioned(
                    top: 40,
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
                    top: 60,
                    left: MediaQuery.of(context).size.width / 2 - 150,
                    child: Container(
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
                  ),
                  Positioned(
                    top: 116,
                    left: MediaQuery.of(context).size.width / 2 - 70,
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2)),
                        width: 130,
                        height: 163,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://cdn.britannica.com/92/211792-050-E764F875/American-singer-Ariana-Grande-2018.jpg",
                        )),
                  ),
                  Positioned(
                      bottom: 200,
                      right: 0,
                      left: 0,
                      child: Center(
                          child: Column(
                        children: [
                          AppText.caption("The Tiny Dragon"),
                          AppText.headingMeduim(
                            "The Tiny Dragon",
                            color: Colors.white,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.all(25),
                            width: double.infinity,
                            // height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      AppText.headingMeduim("4.5"),
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
                                      AppText.headingMeduim("4.5"),
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
                                      AppText.headingMeduim("4.5"),
                                      AppText.captionMedium("Rating")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline_rounded,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width - 90,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      child:
                          Center(child: AppText.headingMeduim("Start Reading")),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
