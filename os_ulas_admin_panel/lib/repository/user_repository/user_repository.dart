import '../../export.dart';

/// A repository class that implements the IUserRepository interface.
/// It uses API services as a data source.
class UserRepository implements IUserRepository {
  /// It gets an external IUserApiService implementation with the Constructor.
  UserRepository(this._userApiService);

  /// API service reference (comes with Dependency Injection).
  final IUserApiService _userApiService;

  /// Fetches all users from the API and returns them.
  @override
  Future<List<User>> getAllUsers() async {
    return await _userApiService.fetchAllUsers();
  }

  @override
  Future<User> addUser(User user) async {
    return await _userApiService.addUser(user);
  }
}
