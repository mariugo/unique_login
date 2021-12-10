import '/domain/entities/user_entity.dart';

abstract class GetAllUsersUseCase {
  Future<List<UserEntity>> call();
}
