part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNews extends NewsEvent {
  const LoadNews();
}

class LoadNewsByUser extends NewsEvent {
  const LoadNewsByUser({this.fresh = false, required this.userId});

  final String userId;
  final bool fresh;
}

class LoadNewsByTag extends NewsEvent {
  const LoadNewsByTag({this.fresh = false, required this.tagId});

  final String tagId;
  final bool fresh;
}
