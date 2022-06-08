import 'package:ebook_app/utils/all_functions.dart';
import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:ebook_app/views/detail/detail_view.dart';
import 'package:ebook_app/views/home/components/book_card.dart';
import 'package:ebook_app/views/home/components/homeTab.dart';
import 'package:ebook_app/views/home/components/mybook.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

final AllFuction _allFunction = AllFuction();

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // Future.delayed(const Duration(milliseconds: 500), () => init());
    super.initState();
  }

  init() async {
    await _allFunction.getBookList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headingMeduim(
                        "Good Morning",
                        color: Colors.white,
                        height: 1,
                      ),
                      AppText.heading(
                        "Great Echidinma",
                        height: 1.8,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                thickness: 2,
                color: kPrimaryColor,
              ),
            ),
            SliverPinnedHeader(
              child: Container(
                color: kBgColor,
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Row(
                  children: [
                    AppText.caption("My Book"),
                    const Spacer(),
                    AppText.captionMedium(
                      "See More",
                    )
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        8,
                        (index) => GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailView())),
                            child: const MyBookCard()))
                  ],
                ),
              ),
            ),
            SliverPinnedHeader(
              child: Container(
                color: kBgColor,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        _allFunction.tabsList.length,
                        (index) => GestureDetector(
                          onTap: () {
                            _allFunction.selectedIndex = index;

                            setState(() {});
                          },
                          child: Tabs(
                            color: index == _allFunction.selectedIndex
                                ? Colors.white
                                : kGreyColor,
                            text: _allFunction.tabsList[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ...List.generate(10, (index) => const BookCard()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
