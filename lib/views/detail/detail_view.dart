import 'package:ebook_app/models/book_model.dart';
import 'package:ebook_app/utils/all_functions.dart';
import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/views/detail/components/book_info_card.dart';
import 'package:ebook_app/views/detail/components/bottom_bottons.dart';
import 'package:ebook_app/views/detail/components/description_card.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  DetailView({
    Key? key,
    required this.image,
    required this.name,
    required this.id,
    required this.url,
    this.isBookmarked,
  }) : super(key: key);
  final String image;
  final String name;
  final String id;
  final String url;
  bool? isBookmarked;

  @override
  State<DetailView> createState() => _DetailViewState();
}

final AllFuction _allFuction = AllFuction();

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    widget.isBookmarked = widget.isBookmarked ?? false;
    _allFuction.detailedBook = null;
    init();
    setState(() {});
    super.initState();
  }

  init() async {
    await _allFuction.getDetails(widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: ListView(
        children: [
          BookInfoCard(
            rating: _allFuction.detailedBook == null
                ? ""
                : _allFuction.detailedBook!.rating,
            pages: _allFuction.detailedBook == null
                ? ""
                : _allFuction.detailedBook!.pages,
            date: _allFuction.detailedBook == null
                ? ""
                : _allFuction.detailedBook!.publishedDate,
            authors: _allFuction.detailedBook == null
                ? []
                : _allFuction.detailedBook!.authors,
            name: widget.name,
            image: widget.image,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: DescriptionCard(
                description: _allFuction.detailedBook == null
                    ? ""
                    : _allFuction.detailedBook!.synopsis,
              )),
          BottomBottons(
            onPressed: () {
              widget.isBookmarked = !widget.isBookmarked!;
              if (widget.isBookmarked!) {
                AllFuction.addBookmark(_allFuction.detailedBook!);
              } else {
                AllFuction.removeBookmark(_allFuction.detailedBook!);
              }
              print(widget.isBookmarked!);
              setState(() {});
              print(AllFuction.bookmarkList.length);
              setState(() {});
            },
            clicked: widget.isBookmarked!,
            url: widget.url,
          )
        ],
      ),
    );
  }
}
