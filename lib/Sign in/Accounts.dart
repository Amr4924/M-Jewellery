// ignore_for_file: file_names

class UserModel {
  String name;
  String email;
  String phone;
  String password;
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
}

class AuthManager {
  static List<UserModel> registerUsers = [];
}

class SaveRecord {
  static String? name;
  static String? email;
  static String? phone;
}
