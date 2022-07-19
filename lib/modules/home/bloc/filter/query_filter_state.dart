part of 'query_filter_bloc.dart';

enum QueryFilterStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}

class QueryFilterState extends Equatable {
  const QueryFilterState({
    this.status = QueryFilterStatus.initial,
    this.q = '',
    this.endpoint = EndpointUrl.user,
    this.loadModel = LoadModel.lazzy,
  });

  final QueryFilterStatus status;
  final String q;
  final EndpointUrl endpoint;
  final LoadModel loadModel;

  QueryFilterState copy({
    QueryFilterStatus? status,
    String? q,
    EndpointUrl? endpoint,
    LoadModel? loadModel,
  }) =>
      QueryFilterState(
        status: status ?? this.status,
        q: q ?? this.q,
        endpoint: endpoint ?? this.endpoint,
        loadModel: loadModel ?? this.loadModel,
      );

  @override
  List<Object> get props => [status, q, endpoint, loadModel];
}
