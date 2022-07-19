part of 'home_bloc.dart';

enum HomeStatus {
  dashboard,
  lessonSchedule,
  lessonSubject,
  lessonDetailSubject,
  taskList,
  valueReport,
  tutoring,
  aboutSchool,
  agendaSchool,
  studentList,
  teacherList,
  profile,
}

class HomeState extends Equatable {
  const HomeState({this.status = HomeStatus.dashboard, this.subject});

  final HomeStatus status;
  final MenuItemApp? subject;

  HomeState copy({HomeStatus? status, MenuItemApp? subject}) => HomeState(
        status: status ?? this.status,
        subject: subject ?? this.subject,
      );

  @override
  List<Object> get props => [status];
}
