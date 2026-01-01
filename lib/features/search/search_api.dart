import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/features/home/home_cubit.dart';
import 'package:news_project/features/home/home_state.dart';
import 'package:news_project/features/home/view.dart';
import 'package:news_project/features/homeNav/view.dart';
import 'package:news_project/features/search/searchResult.dart';
import 'package:news_project/model/article.dart';

import '../error/view.dart';

class SearchApi extends StatelessWidget {
  final String query;
  const SearchApi(this.query, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSearchedData(query: query),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (state is HomeFailure) {
            return Center(child: Text(state.errorMessage),);
          }
          else if (state is HomeSuccess) {
            return SearchResult(articles: state.model);
          }
          return ErrorHandler();
        }),
      ),
    );
  }
}
