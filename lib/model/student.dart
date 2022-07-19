import 'dart:convert';

class Student {
  String name;
  String mobile;
  String department;
  String year;
  String bloodGroup;
  String address;
  Student({
    required this.name,
    required this.mobile,
    required this.department,
    required this.year,
    required this.bloodGroup,
    required this.address,
  });

  Student copyWith({
    String? name,
    String? mobile,
    String? department,
    String? year,
    String? bloodGroup,
    String? address,
  }) {
    return Student(
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      department: department ?? this.department,
      year: year ?? this.year,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile,
      'department': department,
      'year': year,
      'bloodGroup': bloodGroup,
      'address': address,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] ?? '',
      mobile: map['mobile'] ?? '',
      department: map['department'] ?? '',
      year: map['year'] ?? '',
      bloodGroup: map['bloodGroup'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Student(name: $name, mobile: $mobile, department: $department, year: $year, bloodGroup: $bloodGroup, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Student &&
        other.name == name &&
        other.mobile == mobile &&
        other.department == department &&
        other.year == year &&
        other.bloodGroup == bloodGroup &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        mobile.hashCode ^
        department.hashCode ^
        year.hashCode ^
        bloodGroup.hashCode ^
        address.hashCode;
  }
}
