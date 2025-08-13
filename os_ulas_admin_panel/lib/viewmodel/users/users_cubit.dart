import 'package:os_ulas_admin_panel/base/base_cubit/base_cubit.dart';
import 'package:os_ulas_admin_panel/models/user.dart';
import 'package:os_ulas_admin_panel/repository/user_repository/IUser_repository.dart';

class UsersCubit extends BaseCubit<List<User>> {
  UsersCubit(this._userRepository);

  final IUserRepository _userRepository;

  Future<void> getAllUsers() async {
    try {
      emitLoading();
      final users = await _userRepository.getAllUsers();
      emitSuccess(users);
    } catch (e) {
      emitError(e.toString());
    }
  }

  Future<void> refreshUsers() async {
    await getAllUsers();
  }
}
