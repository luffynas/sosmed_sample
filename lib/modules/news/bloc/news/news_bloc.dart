import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sosmed_sample/models/menu_item_app.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsState()) {
    on<LoadNews>(_onLoadNews);
  }

  Future<void> _onLoadNews(LoadNews event, Emitter<NewsState> emit) async {
    emit(state.copy(status: NewsStatus.dashboard));
  }
}
