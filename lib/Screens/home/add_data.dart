import 'package:blood_db/bloc/cubit/db_cubit.dart';
import 'package:blood_db/model/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String dropdownvaluedept = 'CSE';
  String dropdownvalueyear = '1st';
  String dropdownvalueblood = 'A+';
  var itemsdept = [
    'CSE',
    'CE',
    'EC',
    'EEE',
    'ME',
  ];
  var itemsblood = ['A+', 'A-', 'AB+', 'AB-', 'B+', 'B-', 'O+', 'O-'];
  var itemsyear = [
    '1st',
    '2nd',
    '3rd',
    '4th',
  ];
  TextEditingController stdName = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Add Student details',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 27,
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Name:-",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 250,
                          child: TextFormField(
                            controller: stdName,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: kPrimaryLightColor,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              hintText: "NAME",
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Mobile:-",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 250,
                          child: TextFormField(
                            controller: mobileController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: kPrimaryLightColor,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              hintText: "9876543210",
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Department:-",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        DropdownButton(
                          dropdownColor: kPrimaryLightColor,
                          // Initial Value
                          value: dropdownvaluedept,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: itemsdept.map((String itemsdept) {
                            return DropdownMenuItem(
                              value: itemsdept,
                              child: Text(itemsdept),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvaluedept = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Year:-",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        DropdownButton(
                          dropdownColor: kPrimaryLightColor,
                          // Initial Value
                          value: dropdownvalueyear,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: itemsyear.map((String itemsyear) {
                            return DropdownMenuItem(
                              value: itemsyear,
                              child: Text(itemsyear),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalueyear = newValue!;
                            });
                          },
                        ),
                      ],
                    ),

                    ///blood
                    ///
                    //
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Blood group:-",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        DropdownButton(
                          dropdownColor: kPrimaryLightColor,
                          // Initial Value
                          value: dropdownvalueblood,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: itemsblood.map((String itemsblood) {
                            return DropdownMenuItem(
                              value: itemsblood,
                              child: Text(itemsblood),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalueblood = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: const [],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Address:-",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            height: 80,
                            width: 250,
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 5,
                              controller: addressController,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: kPrimaryLightColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                hintText: "ADDRESS",
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    // Row(
                    //   children: const [
                    //     Padding(
                    //       padding: EdgeInsets.only(left: 20),
                    //       child: Text(
                    //         "Gender:-",
                    //         style: TextStyle(fontSize: 22),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    BlocBuilder<DbCubit, DbState>(
                      builder: (context, state) {
                        if (state is DbLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is DbLoaded) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('SuccessFully Added')));
                          Navigator.of(context).pop();
                        }
                        return SizedBox(
                          width: 250,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (stdName.text.isNotEmpty &&
                                  mobileController.text.isNotEmpty) {
                                Student student = Student(
                                    name: stdName.text,
                                    mobile: mobileController.text,
                                    department: dropdownvaluedept,
                                    year: dropdownvalueyear,
                                    bloodGroup: dropdownvalueblood,
                                    address: addressController.text);
                                BlocProvider.of<DbCubit>(context)
                                    .createUser(student: student);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                primary: kPrimaryColor,
                                elevation: 8),
                            child: Text(
                              "Save".toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
