import 'package:blood_db/bloc/cubit/db_cubit.dart';
import 'package:blood_db/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Screens/home/btmnav.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DbCubit(),
      child: MaterialApp(
        title: 'Blood DB',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            textTheme:
                GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
        home: const BtmNav(),
      ),
    );
  }
}
