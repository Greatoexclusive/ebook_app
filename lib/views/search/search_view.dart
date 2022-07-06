import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook_app/utils/all_functions.dart';
import 'package:ebook_app/utils/color.dart';
import 'package:ebook_app/utils/text.dart';
import 'package:ebook_app/views/detail/detail_view.dart';
import 'package:ebook_app/views/home/components/book_card.dart';
import 'package:ebook_app/views/home/components/bookcard_skeleton.dart';
import 'package:ebook_app/views/search/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key, required this.q}) : super(key: key);
  final String q;
  @override
  State<SearchView> createState() => _SearchViewState();
}

final AllFuction _allFunction = AllFuction();

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    _allFunction.searchList = [];
    Future.delayed(const Duration(milliseconds: 200), () => init());

    super.initState();
  }

  init() async {
    await _allFunction.getSearchList(widget.q);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              // snap: true,
              backgroundColor: kBgColor,
              leading: GestureDetector(
                onTap: () {},
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    )),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchBar(
                                    text: widget.q,
                                  )));
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                          color: kGreyColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width - 135,
                      child: Row(
                        children: [
                          AppText.captionMedium("Search myNEWZ"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                )
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),
            const SliverToBoxAdapter(
                child: Divider(
              thickness: 2,
            )),
            SliverPinnedHeader(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                color: kBgColor,
                child: AppText.headingMeduim('Search result for "${widget.q}"'),
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
                        _allFunction.searchList.isEmpty
                            ? 6
                            : _allFunction.searchList.length,
                        (index) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailView(
                                  url: _allFunction.searchList[index].url,
                                  id: _allFunction.searchList[index].bookId,
                                  image: _allFunction.searchList[index].cover,
                                  name: _allFunction.searchList[index].name),
                            ),
                          ),
                          child: _allFunction.searchList.isEmpty
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
                                  image: _allFunction.searchList[index].cover),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
        backgroundColor: kBgColor,
      ),
    );
  }
}
