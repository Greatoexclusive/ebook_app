import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebbView extends StatefulWidget {
  const WebbView({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<WebbView> createState() => _WebbViewState();
}

class _WebbViewState extends State<WebbView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: Column(
          children: [
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.url,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 90,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child:
                      Center(child: AppText.headingMeduim("Finshed Reading")),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
