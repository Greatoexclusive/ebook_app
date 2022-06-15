import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:ebook_app/views/webview/webview.dart';
import 'package:flutter/material.dart';

class BottomBottons extends StatelessWidget {
  const BottomBottons({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: kGreyColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => WebbView(
                          url: url,
                        )),
                  ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 90,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Center(child: AppText.headingMeduim("Start Reading")),
            ),
          )
        ],
      ),
    );
  }
}
