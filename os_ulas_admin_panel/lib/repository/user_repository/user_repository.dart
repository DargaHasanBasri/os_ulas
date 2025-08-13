import 'package:os_ulas_admin_panel/repository/user_repository/IUser_repository.dart';
import 'package:os_ulas_admin_panel/services/api_services/user_api_services/IUser_api_service.dart';
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
}
