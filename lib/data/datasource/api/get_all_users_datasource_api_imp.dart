import 'dart:convert';

import 'package:unique_login/data/datasource/api/get_all_users_datasource_api.dart';
import 'package:unique_login/data/dto/user_dto.dart';
import 'package:http/http.dart' as http;

class GetAllUsersDatasourceApiImp implements GetAllUsersDatasourceApi {
  @override
  Future<List<UserDto>> call() async {
    final _url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(_url);
    final _json = jsonDecode(response.body) as List;
    List<UserDto> _users =
        _json.map((_user) => UserDto.fromMap(_user)).toList();
    return _users;
  }
}
