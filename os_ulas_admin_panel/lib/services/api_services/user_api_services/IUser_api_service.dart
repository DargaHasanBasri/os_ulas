import 'package:os_ulas_admin_panel/models/user.dart';

/// The interface that API services must implement.
/// It defines API operations that only deal with "user" data.
abstract class IUserApiService {
  /// The method that retrieves all users from the API.
  Future<List<User>> fetchAllUsers();
}
