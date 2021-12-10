import '/usecases/get_all_users/get_all_users_usecase.dart';
import '/usecases/login_user/log_in_user_usecase.dart';

class UserController {
  final GetAllUsersUseCase getAllUsersUseCase;
  final LogInUserUseCase logInUserUseCase;

  UserController({
    required this.getAllUsersUseCase,
    required this.logInUserUseCase,
  });

  loginUser(String _email, String _password) {
    var response = logInUserUseCase(_email, _password);
    return response;
  }

  getAllUsers() async {
    var response = await getAllUsersUseCase();
    return response;
  }
}
