import '/domain/entities/user_entity.dart';

abstract class GetAllUsersUseCase {
  List<UserEntity> call();
}
