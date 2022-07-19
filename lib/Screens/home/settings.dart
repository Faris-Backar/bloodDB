import 'package:blood_db/Screens/home/add_data.dart';
import 'package:blood_db/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 30,
            child: Center(
              child: Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 92,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://cdn.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp"),
            ),
          ),
          const SizedBox(
            height: 10, //just for a padding
          ),
          const SizedBox(
            child: Text(
              "Admin",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
          const SizedBox(
            height: 6, //just for a padding
          ),
          const SizedBox(
            height: 25, //just for a padding
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: kPrimaryLightColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: InkWell(
                    splashColor: kPrimaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddData()));
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.security,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Add student data",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.navigate_next),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: kPrimaryLightColor,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: InkWell(
                    splashColor: kPrimaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    onTap: () {
                      signout(context);
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.logout,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(Icons.navigate_next),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Future<void> signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => MyHomePage()), (route) => false);
  }
}
