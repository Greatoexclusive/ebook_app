import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/core/services/pref_services.dart';
import 'package:ebook_app/utils/all_functions.dart';
import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:ebook_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({Key? key}) : super(key: key);

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  @override
  void initState() {
    AllFuction.bookmarkList = PreferencesServices.storedList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            enableArrowBack: true,
            isDisabled: false,
            title: "Bookmarks",
            icon: Icons.delete_outline,
            onTap: () {
              if (AllFuction.bookmarkList.isEmpty) {
                final snack = SnackBar(
                  backgroundColor: kBgColor,
                  elevation: 5,
                  duration: const Duration(seconds: 4),
                  content: AppText.headingMeduim(
                      "You currently do not have any bookmarks!"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: kBgColor,
                    title: const Center(
                        child: Icon(
                      Icons.warning,
                      size: 50,
                      color: kBgColor,
                    )),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: AppText.headingMeduim("Clear bookmark?"),
                        )
                      ],
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor, // Background color
                            ),
                            autofocus: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                          // Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor, // Background color
                            ),
                            autofocus: true,
                            onPressed: () {
                              AllFuction.bookmarkList.clear();
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          AllFuction.bookmarkList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: (MediaQuery.of(context).size.height / 2) - 70,
                    ),
                    Center(
                      child: AppText.heading(
                        "No bookmarks",
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              : Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(
                          AllFuction.bookmarkList.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      height: 120,
                                      width: 120,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: AllFuction
                                            .bookmarkList[index].cover,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    AppText.heading("text")
                                  ],
                                ),
                              )),
                    ],
                  ),
                ),
        ],
      ),
      backgroundColor: kBgColor,
    ));
  }
}
