import '/domain/entities/user_entity.dart';

abstract class GetAllUsersRepository {
  List<UserEntity> call();
}
