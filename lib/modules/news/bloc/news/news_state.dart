part of 'news_bloc.dart';

enum NewsStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}

class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStatus.initial,
    this.news = const <News>[],
    this.hasReachedMax = false,
  });

  final NewsStatus status;
  final List<News> news;
  final bool hasReachedMax;

  NewsState copy({
    NewsStatus? status,
    List<News>? news,
    bool? hasReachedMax,
  }) =>
      NewsState(
        status: status ?? this.status,
        news: news ?? this.news,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  String toString() {
    return '''NewsState { status: $status, hasReachedMax: $hasReachedMax, posts: ${news.length} }''';
  }

  @override
  List<Object> get props => [status, news, hasReachedMax];
}
