import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sosmed_sample/core/api/app_api.dart';

part 'query_filter_event.dart';
part 'query_filter_state.dart';

enum EndpointUrl { user, issues, repositories }

enum LoadModel { lazzy, withIndex }

class QueryFilterBloc extends Bloc<QueryFilterEvent, QueryFilterState> {
  QueryFilterBloc() : super(const QueryFilterState()) {
    on<FilterQuery>(_onFilterQuery);
  }

  Future<void> _onFilterQuery(
    FilterQuery event,
    Emitter<QueryFilterState> emit,
  ) async {
    if (state.status == QueryFilterStatus.initial) {
      emit(state.copy(status: QueryFilterStatus.loading));
    }

    emit(state.copy(
      status: QueryFilterStatus.initial,
      q: event.q,
      endpoint: event.endpoint,
      loadModel: event.loadModel,
    ));

    try {
      int perPage = 10;
      log('message ::: event.q :: ${event.q}');
      var query = event.q!.isEmpty ? 'q=${event.q}' : 'q=a';
      var path = 'users';
      switch (event.endpoint) {
        case EndpointUrl.issues:
          path = 'issues';
          emit(state.copy(status: QueryFilterStatus.loading));
          break;
        case EndpointUrl.repositories:
          path = 'repositories';
          emit(state.copy(status: QueryFilterStatus.loading));
          break;
        default:
          path = 'users';
          emit(state.copy(status: QueryFilterStatus.loading));
          break;
      }

      log('message :: $query');
      final data =
          await PublicApi.get('/search/$path?$query&per_page=$perPage');
    } catch (e) {
      log('message ::: error : $e');
    }
  }
}
