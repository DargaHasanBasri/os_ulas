import '../../export.dart';

class UsersCubit extends BaseCubit<List<User>> {
  UsersCubit(this._userRepository);

  final IUserRepository _userRepository;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> getAllUsers() async {
    try {
      emitLoading();
      final users = await _userRepository.getAllUsers();
      emitSuccess(users);
    } catch (e) {
      emitError(e.toString());
    }
  }

  Future<void> addUser(User user) async {
    try {
      emitLoading();
      await _userRepository.addUser(user);
      emitSuccess();
    } catch (e) {
      emitError(e.toString());
      rethrow;
    }
  }

  Future<void> refreshUsers() async {
    await getAllUsers();
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
