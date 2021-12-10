import 'package:unique_login/data/dto/user_dto.dart';
import 'get_all_users_repository_data.dart';

class GetAllUsersRepositoryDataImp implements GetAllUsersRepositoryData {
  final GetAllUsersRepositoryData _getAllUsersRepositoryData;

  GetAllUsersRepositoryDataImp(this._getAllUsersRepositoryData);

  @override
  Future<List<UserDto>> call() async {
    return await _getAllUsersRepositoryData();
  }
}
