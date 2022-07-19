part of 'query_filter_bloc.dart';

abstract class QueryFilterEvent extends Equatable {
  const QueryFilterEvent();

  @override
  List<Object> get props => [];
}

class FilterQuery extends QueryFilterEvent {
  const FilterQuery({this.q, this.endpoint, this.loadModel});

  final String? q;
  final EndpointUrl? endpoint;
  final LoadModel? loadModel;
}
