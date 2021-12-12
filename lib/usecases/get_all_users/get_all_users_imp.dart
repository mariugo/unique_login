import 'package:unique_login/domain/repositories/get_all_users_repository.dart';
import '/domain/entities/user_entity.dart';
import 'get_all_users_usecase.dart';

class GetAllUsersImp implements GetAllUsersUseCase {
  final GetAllUsersRepository _getAllUsersRepository;

  GetAllUsersImp(this._getAllUsersRepository);

  @override
  List<UserEntity> call() {
    return _getAllUsersRepository();
  }
}
