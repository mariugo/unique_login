import 'package:unique_login/domain/entities/user_entity.dart';
import 'package:unique_login/domain/repositories/get_all_users_repository.dart';

class GetAllUsersRepositoryDataImp implements GetAllUsersRepository {
  final GetAllUsersRepository _getAllUsersRepository;

  GetAllUsersRepositoryDataImp(this._getAllUsersRepository);

  @override
  List<UserEntity> call() {
    return _getAllUsersRepository();
  }
}
