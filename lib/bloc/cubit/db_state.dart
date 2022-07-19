part of 'db_cubit.dart';

@immutable
abstract class DbState {}

class DbInitial extends DbState {}

class DbLoading extends DbState {}

class DbLoaded extends DbState {
  final List<Student> student;
  DbLoaded({
    required this.student,
  });
}

class DbError extends DbState {
  final String error;
  DbError({
    required this.error,
  });
}
