import '/domain/entities/user_entity.dart';

abstract class GetAllUsersRepository {
  Future<List<UserEntity>> call();
}
