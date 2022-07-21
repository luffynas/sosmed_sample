import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sosmed_sample/modules/news/datasource/local/news_local.dart';
import 'package:sosmed_sample/modules/news/models/news.dart';
import 'package:sosmed_sample/modules/news/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsState()) {
    on<LoadNews>(_onLoadNews);
    on<LoadNewsByUser>(_onLoadNewsByUser);
    on<LoadNewsByTag>(_onLoadNewsByTag);
  }

  final newsRepository = NewsRepository(NewsLocal());

  Future<void> _onLoadNews(LoadNews event, Emitter<NewsState> emit) async {
    // emit(state.copy(status: NewsStatus.dashboard));
  }

  Future<void> _onLoadNewsByUser(
      LoadNewsByUser event, Emitter<NewsState> emit) async {
    if (state.hasReachedMax) return;

    log('message :: state.news.length ::: ${state.news.length}');
    if (event.fresh) {
      emit(state.copy(status: NewsStatus.initial));
    }

    await emit.forEach<List<News>>(
      newsRepository.getPosts(
        fresh: event.fresh,
        offset: state.news.length,
      ),
      onData: (news) => state.copy(
        status: news.isEmpty ? NewsStatus.empty : NewsStatus.success,
        news: news,
        hasReachedMax: false,
      ),
      onError: (_, __) => state.copy(
        status: NewsStatus.failure,
      ),
    );
  }

  Future<void> _onLoadNewsByTag(
      LoadNewsByTag event, Emitter<NewsState> emit) async {
    // emit(state.copy(status: NewsStatus.dashboard));
  }
}
