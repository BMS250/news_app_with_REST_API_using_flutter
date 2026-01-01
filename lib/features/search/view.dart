import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_project/core/resources/app_colors.dart';
import 'package:news_project/core/resources/app_icons.dart';
import 'package:news_project/features/search/searchResult.dart';
import 'package:news_project/features/search/search_api.dart';

import '../../model/article.dart';

class Search extends StatefulWidget {
  final List<Article> articles;
  const Search(this.articles, {super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  String searchValue = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String searchValue = "";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Row(
            spacing: 6,
            children: [
              Expanded(
                child: SizedBox(
                  width: 100,
                  height: 45,
                  child: TextFormField(
                    onFieldSubmitted: (value) => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchApi(searchValue),
                        )
                    ),
                    controller: _searchController,
                    cursorHeight: 30,
                    onChanged: (value) {
                      searchValue = value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(AppColors.textFieldColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          AppIcons.search,
                          colorFilter: ColorFilter.mode(
                              Color(AppColors.textFieldHintColor),
                              BlendMode.srcIn),
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            setState(() {
                              searchValue = "";
                            });
                          },
                          child: SvgPicture.asset(
                            AppIcons.erase,
                            // colorFilter: ColorFilter.mode(
                            //     Color(AppColors.textFieldHintColor),
                            //     BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Cancel",
                style: TextStyle(
                  color: Color(0xff0E0AB1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
