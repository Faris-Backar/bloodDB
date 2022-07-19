import 'package:bloc/bloc.dart';
import 'package:blood_db/model/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'db_state.dart';

class DbCubit extends Cubit<DbState> {
  DbCubit() : super(DbInitial());
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Student> studentsList = [];
  createUser({required Student student}) async {
    emit(DbInitial());
    emit(DbLoading());
    try {
      await _firebaseFirestore
          .collection('student')
          .doc(student.name)
          .set(student.toMap());
      emit(DbLoaded(student: studentsList));
    } on FirebaseException catch (e) {
      emit(DbError(error: e.code));
    }
  }

  fetchDB() async {
    emit(DbInitial());
    emit(DbLoading());
    try {
      final res = await _firebaseFirestore.collection('student').get();
      final response = res.docs.map((e) => Student.fromMap(e.data())).toList();
      studentsList = response;
      emit(DbLoaded(student: studentsList));
    } on FirebaseException catch (e) {
      emit(DbError(error: e.code));
    }
  }

  filterDb({required String query}) {
    emit(DbInitial());
    emit(DbLoading());
    List<Student> filtererdList =
        studentsList.where((element) => element.name.contains(query)).toList();
    print(filtererdList);
    emit(DbLoaded(student: filtererdList));
  }
}
