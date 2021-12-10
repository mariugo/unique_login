import 'package:unique_login/data/dto/user_dto.dart';

abstract class GetAllUsersRepositoryData {
  Future<List<UserDto>> call();
}
