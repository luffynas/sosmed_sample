import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sosmed_sample/models/menu_item_app.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GotoDashboard>(_onDashboard);
  }

  Future<void> _onDashboard(
      GotoDashboard event, Emitter<HomeState> emit) async {
    emit(state.copy(status: HomeStatus.dashboard));
  }
}
