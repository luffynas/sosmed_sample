part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class LoadTab extends BottomNavigationEvent {
  const LoadTab();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return super.toString();
  }
}

class SelectTab extends BottomNavigationEvent {
  SelectTab({required this.index});
  final int index;

  @override
  List<Object> get props => [index];

  @override
  String toString() {
    return super.toString();
  }
}
