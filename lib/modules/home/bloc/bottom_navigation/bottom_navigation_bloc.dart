import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sosmed_sample/modules/home/models/tab_model.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(TabLoading()) {
    on<SelectTab>(_mapTabIndexToState);
  }

  Future<void> _mapTabIndexToState(
    SelectTab event,
    Emitter<BottomNavigationState> emit,
  ) async {
    if (event.index == 1) {
      emit(NewsSelected());
    } else if (event.index == 2) {
      emit(BookmarkSelected());
    } else {
      emit(HomeSelected());
    }
  }
}
