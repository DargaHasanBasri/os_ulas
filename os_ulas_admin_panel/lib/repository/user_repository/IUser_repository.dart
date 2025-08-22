import 'package:os_ulas_admin_panel/models/user.dart';

/// User repository interface.
/// This interface defines basic data access operations related to user data.
abstract class IUserRepository {
  /// Method that returns all users.
  Future<List<User>> getAllUsers();

  Future<User> addUser(User user);
}
