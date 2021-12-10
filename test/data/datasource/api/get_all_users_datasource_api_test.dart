import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:unique_login/data/dto/user_dto.dart';
import 'package:http/http.dart' as http;

main() {
  Future<List<UserDto>> getUsers() async {
    final _url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(_url);
    final _json = jsonDecode(response.body) as List;
    List<UserDto> _users =
        _json.map((_user) => UserDto.fromMap(_user)).toList();
    return _users;
  }

  group('Testing API', () {
    test('Should return a list of UserDto from the API', () async {
      var result = await getUsers();
      expect(result, isInstanceOf<List<UserDto>>());
    });

    test('Should return first id as 1', () async {
      var result = await getUsers();
      expect(result.first.id, 1);
    });

    test('Should return first name as Leanne Graham', () async {
      var result = await getUsers();
      expect(result.first.name, 'Leanne Graham');
    });

    test('Should return a 10 length list', () async {
      var result = await getUsers();
      expect(result.length == 10, true);
    });
  });
}
