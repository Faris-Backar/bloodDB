import 'package:blood_db/Screens/home/search_page.dart';
import 'package:blood_db/bloc/cubit/db_cubit.dart';
import 'package:blood_db/constants.dart';
import 'package:blood_db/model/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  List<Student> studentList = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DbCubit>(context).fetchDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchPage(),
              ),
            ),
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: TextField(
                    onChanged: (value) {
                      BlocProvider.of<DbCubit>(context).filterDb(query: value);
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                        },
                      ),
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              BlocBuilder<DbCubit, DbState>(
                builder: (context, state) {
                  if (state is DbLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is DbLoaded) {
                    studentList = state.student;
                    if (studentList.isEmpty) {
                      return const Center(
                        child: Text('No data is Found'),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: studentList.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 5.0,
                        child: ListTile(
                          title: Text(studentList[index].name),
                          onTap: () {},
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
        // <-- wrap this around
        // child: Column(
        //   children: const [
        //     ProfileBar(),
        //   ],
        // ),
      ),
    );
  }
}
