import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/model/article.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitializing());

  final dio = Dio();

  Future<void> getHeadLineData() async {
    try {
      emit(HomeLoading());
      final Response response = await dio.get(
        "https://newsapi.org/v2/everything",
        queryParameters: {
          'q': 'everything',
          'apiKey': 'd2ef1aaa15ce40d28d819201d76a24f4'
        }
      );
      final articles = response.data['articles'] as List;
      final data = articles.map((art) => Article.fromJson(art)).toList();
      emit(HomeSuccess(data));
    }
    on DioException catch(e) {
      emit(HomeFailure(e.message ?? ""));
    }
    catch(e) {
      emit(HomeFailure(e.toString()));
    }
  }
  Future<void> getSearchedData({required String query}) async {
    try {
      emit(HomeLoading());
      final Response response = await dio.get(
          "https://newsapi.org/v2/everything",
          queryParameters: {
            'q': query,
            'apiKey': 'd2ef1aaa15ce40d28d819201d76a24f4'
          }
      );
      final articles = response.data['articles'] as List;
      final data = articles.map((art) => Article.fromJson(art)).toList();
      emit(HomeSuccess(data));
    }
    on DioException catch(e) {
      emit(HomeFailure(e.message ?? ""));
    }
    catch(e) {
      emit(HomeFailure(e.toString()));
    }
  }
}