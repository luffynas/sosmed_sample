part of 'main_bloc.dart';

enum MainType {
  initial,
  loading,
  authenticated,
  unauthenticated,
  onboarding,
  previewLoading,
  failure,
}

class MainState extends Equatable {
  const MainState({this.mainType = MainType.initial, this.message = ''});

  final MainType mainType;
  final String message;

  MainState copyWith({
    MainType? mainType,
    String? message,
  }) {
    return MainState(
      mainType: mainType ?? this.mainType,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [mainType, message];
}
