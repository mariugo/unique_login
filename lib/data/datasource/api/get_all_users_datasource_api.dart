import 'package:unique_login/data/dto/user_dto.dart';

abstract class GetAllUsersDatasourceApi {
  Future<List<UserDto>> call();
}
