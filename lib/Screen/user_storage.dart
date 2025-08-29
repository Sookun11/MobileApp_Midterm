class UserStorage {
  UserStorage._privateConstructor();
  static final UserStorage instance = UserStorage._privateConstructor();

  final Map<String, String> _users = {}; // email -> password

  void addUser(String email, String password) {
    _users[email] = password;
  }

  bool validateUser(String email, String password) {
    return _users[email] == password;
  }

  bool isRegistered(String email) {
    return _users.containsKey(email);
  }
}
