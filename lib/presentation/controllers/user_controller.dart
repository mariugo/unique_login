import '/data/datasource/api/get_all_users_datasource_api_imp.dart';
import '/usecases/login_user/log_in_user_usecase.dart';

class UserController {
  final GetAllUsersDatasourceApiImp? getAllUsersApi;
  final LogInUserUseCase? logInUserUseCase;

  UserController({
    this.getAllUsersApi,
    this.logInUserUseCase,
  });

  loginUser(String _email, String _password) {
    var response = logInUserUseCase!(_email, _password);
    return response;
  }

  getAllUsers() async {
    var response = await getAllUsersApi!();
    return response;
  }
}
