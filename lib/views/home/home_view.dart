import 'package:ebook_app/utils/all_functions.dart';
import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:ebook_app/views/detail/detail_view.dart';
import 'package:ebook_app/views/home/components/book_card.dart';
import 'package:ebook_app/views/home/components/bookcard_skeleton.dart';
import 'package:ebook_app/views/home/components/my_book_skeleton.dart';
import 'package:ebook_app/views/search/search_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ebook_app/views/home/components/home_tab.dart';
import 'package:ebook_app/views/home/components/my_book.dart';
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
    init();
    setState(() {});
    super.initState();
  }

  init() async {
    await _allFunction.getBookList();
    setState(() {});
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.heading(
                      "myBookz",
                      // height: 1.8,
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchBar()));
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
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
                    AppText.caption("Popular"),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                physics: _allFunction.popularList.isEmpty
                    ? const NeverScrollableScrollPhysics()
                    : null,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        _allFunction.popularList.isEmpty
                            ? 3
                            : _allFunction.popularList.length,
                        (index) => _allFunction.popularList.isEmpty
                            ? const MyBookSkeleton()
                            : GestureDetector(
                                onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailView(
                                          url:
                                              _allFunction.genreList[index].url,
                                          id: _allFunction
                                              .popularList[index].bookId,
                                          name: _allFunction
                                              .popularList[index].name,
                                          image: _allFunction
                                              .popularList[index].cover,
                                        ),
                                      ),
                                    ),
                                child: MyBookCard(
                                  text: _allFunction.popularList[index].name,
                                  image: _allFunction.popularList[index].cover,
                                )))
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
                          onTap: () async {
                            _allFunction.selectedIndex = index;

                            setState(() {});
                            _allFunction.genreList = [];
                            await _allFunction.getGenreList();
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: StaggeredGrid.count(
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 400 ? 5 : 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    children: [
                      ...List.generate(
                        _allFunction.genreList.isEmpty
                            ? 6
                            : _allFunction.genreList.length,
                        (index) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailView(
                                  url: _allFunction.genreList[index].url,
                                  id: _allFunction.genreList[index].bookId,
                                  image: _allFunction.genreList[index].cover,
                                  name: _allFunction.genreList[index].name),
                            ),
                          ),
                          child: _allFunction.genreList.isEmpty
                              ? BookCardSkeleton(
                                  height: index.isEven
                                      ? 250
                                      : (index ~/ 3).isEven
                                          ? 300
                                          : 200,
                                )
                              : BookCard(
                                  height: index.isEven
                                      ? 250
                                      : (index ~/ 3).isEven
                                          ? 300
                                          : 200,
                                  image: _allFunction.genreList[index].cover),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
