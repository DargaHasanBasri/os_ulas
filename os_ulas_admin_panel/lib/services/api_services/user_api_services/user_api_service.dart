import '../../export.dart';

/// Class that implements IUserApiService.
/// It makes API calls and transforms the incoming data into a model.
class UserApiService implements IUserApiService {
  /// API infrastructure class is obtained with Constructor.
  UserApiService(this._apiBase);

  /// The base API class that makes HTTP requests.
  final ApiBase _apiBase;

  /// It retrieves all users by sending a GET request
  /// from the API to the "/user/all" endpoint.
  @override
  Future<List<User>> fetchAllUsers() async {
    /// The API request is discarded.
    final response = await _apiBase.get("/user/all");

    /// Converts the response to JSON format
    final data = jsonDecode(response.body);

    /// If the expected data type is not a list, we throw an error.
    if (data is! List) {
      throw FetchDataException("Invalid response format");
    }

    /// Converts JSON list to User model list.
    final allUsersData = data
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
    return allUsersData;
  }

  @override
  Future<User> addUser(User user) async {
    final response = await _apiBase.post(
      "/user/register",
      user.toJson(),
    );

    final data = jsonDecode(response.body);

    return User.fromJson(data as Map<String, dynamic>);
  }
}
