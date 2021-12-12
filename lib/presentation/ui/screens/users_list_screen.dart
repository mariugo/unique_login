import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '/data/dto/user_dto.dart';
import '/presentation/ui/theme/design_system.dart';
import '/presentation/ui/widgets/card_widget.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  ValueNotifier<List<UserDto>> userList = ValueNotifier<List<UserDto>>([]);

  addUsers() async {
    final _url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(_url);
    final _json = jsonDecode(response.body) as List;
    userList.value = _json.map((_user) => UserDto.fromMap(_user)).toList();
    return userList.value;
  }

  @override
  Widget build(BuildContext context) {
    addUsers();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de usuários'),
        backgroundColor: DesignSystem.primaryColor,
      ),
      body: SafeArea(
        child: ValueListenableBuilder<List<UserDto>>(
          valueListenable: userList,
          builder: (_, value, __) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (_, index) => CardWidget(
              name: value[index].newName,
              username: value[index].newUsername,
              email: value[index].newEmail,
              phone: value[index].newPhone,
              website: value[index].newWebsite,
            ),
          ),
        ),
      ),
    );
  }
}
