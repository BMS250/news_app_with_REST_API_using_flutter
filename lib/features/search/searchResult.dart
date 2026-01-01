import 'package:flutter/material.dart';
import 'package:news_project/core/resources/app_colors.dart';
import 'package:news_project/model/article.dart';

import '../../core/resources/app_images.dart';
import '../widgets/new_item.dart';

class SearchResult extends StatelessWidget {
  final List<Article> articles;
  const SearchResult({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Search Results",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => NewItem(newImage: articles[index].urlToImage ?? "", newTitle: articles[index].author ?? "", newSubTitle: articles[index].description ?? "", newDate: articles[index].publishedAt ?? ""),
            ),
          ],
        ),
      ),
    );
  }

  // List<NewItem> GetResults(List<>) {
  //   List<NewItem> resultItems = [];
  //
  // }
}
