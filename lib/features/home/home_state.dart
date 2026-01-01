import 'package:news_project/model/article.dart';

abstract class HomeState {}

class HomeInitializing extends HomeState {

}

class HomeLoading extends HomeState {

}

class HomeSuccess extends HomeState {
  final List<Article> model;
  HomeSuccess(this.model);

}

class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure(this.errorMessage);
}