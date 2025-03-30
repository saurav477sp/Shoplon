import 'package:college_project/components/text/BodyText.dart';
import 'package:college_project/components/text/SubHeadingText.dart';
import 'package:college_project/screens/search/views/components/search_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // return const BuyFullKit(
  //   images: [
  //     "assets/screens/SEARCH_1.png",
  //     "assets/screens/Search_2.png",
  //     "assets/screens/Search_3.png",
  //     "assets/screens/Search_4.png",
  //     "assets/screens/Search_5.png",
  //     "assets/screens/Search_6.png",
  //     "assets/screens/Search_7.png",
  //     "assets/screens/Search_8.png",
  //   ],
  // );

  final TextEditingController _searchController = TextEditingController();

  final List<String> _recentSearches = [
    'Shirt',
    'Hat',
    'Dress',
  ];

  void _addSearchTerm(String term) {
    if (term.trim().isEmpty) return;

    setState(() {
      _recentSearches.insert(0, term);
      if (_recentSearches.length > 10) {
        _recentSearches.removeLast();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 100, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/logo/Shoplon.svg",
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                  height: 20,
                  width: 100,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/Close.svg',
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color!,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SearchForm(
              onFieldSubmitted: (value) {
                _addSearchTerm(value!);
                _searchController.clear();
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SubHeadingText(text: 'Recent Searches'),
                TextButton(
                  onPressed: () => print('See All clicked'),
                  child: const BodyText(text: 'See All'),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children:
                    _recentSearches
                        .map((search) => _buildSearchItem(search))
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/Clock.svg',
            height: 24,
            color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: SubHeadingText(text: text, fontWeight: FontWeight.normal),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/Close.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
              height: 18,
            ),
            onPressed: () {
              setState(() {
                _recentSearches.remove(text);
              });
            },
          ),
        ],
      ),
    );
  }
}
