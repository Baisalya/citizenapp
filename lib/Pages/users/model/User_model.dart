
class UserModel {
  final String username;
  final String email;
  final String phoneNo;
  final String profilePic;
  final String password;

  UserModel({
    required this.username,
    required this.email,
    required this.phoneNo,
    required this.profilePic,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'phoneNo': phoneNo,
      'profilePic': profilePic,
    };
  }
}
