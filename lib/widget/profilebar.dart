import 'package:blood_db/constants.dart';
import 'package:flutter/material.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  String name = 'muhammed';
  String bloodgroup = 'AB+';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 80,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(bloodgroup),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
