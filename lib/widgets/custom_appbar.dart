import 'package:ebook_app/utils/text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {Key? key,
      required this.title,
      this.icon,
      required this.onTap,
      required this.isDisabled,
      required this.enableArrowBack})
      : super(key: key);

  final String title;
  final IconData? icon;
  final Function()? onTap;
  bool? isDisabled;
  bool? enableArrowBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 20, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          enableArrowBack!
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                )
              : const Center(),
          const SizedBox(
            width: 20,
          ),
          AppText.heading(title),
          Spacer(),
          isDisabled == false
              ? InkWell(
                  onTap: onTap,
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              : Center()
        ],
      ),
    );
  }
}
