part of 'news_bloc.dart';

enum NewsStatus {
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

class NewsState extends Equatable {
  const NewsState({this.status = NewsStatus.dashboard, this.subject});

  final NewsStatus status;
  final MenuItemApp? subject;

  NewsState copy({NewsStatus? status, MenuItemApp? subject}) => NewsState(
        status: status ?? this.status,
        subject: subject ?? this.subject,
      );

  @override
  List<Object> get props => [status];
}
