@Timeout(Duration(seconds: 5))

import 'package:flutter_test/flutter_test.dart';
import 'package:unique_login/domain/entities/user_entity.dart';
import 'package:unique_login/domain/repositories/get_all_users_repository.dart';
import 'package:unique_login/usecases/get_all_users/get_all_users_imp.dart';
import 'package:unique_login/usecases/get_all_users/get_all_users_usecase.dart';

class GetAllUsersRepositoryImp implements GetAllUsersRepository {
  @override
  List<UserEntity> call() {
    final list = [
      UserEntity(
          id: 1,
          name: 'Mariugo',
          username: 'mariugo',
          email: 'mariugo@mariugo.com',
          phone: '123-16541-21',
          website: 'www.mariugo.com'),
      UserEntity(
          id: 2,
          name: 'João',
          username: 'joao',
          email: 'joao@joao.com',
          phone: '123-491-21',
          website: 'www.joao.com'),
      UserEntity(
          id: 3,
          name: 'Carlos',
          username: 'carlos',
          email: 'carlos@carlos.com',
          phone: '123-987651-21',
          website: 'www.carlos.com'),
      UserEntity(
          id: 4,
          name: 'Pedro',
          username: 'pedro',
          email: 'pedro@pedro.com',
          phone: '123-12050-21',
          website: 'www.pedro.com'),
    ];
    return list;
  }
}

main() {
  GetAllUsersUseCase getAllUsersUseCase =
      GetAllUsersImp(GetAllUsersRepositoryImp());

  group('Testing GetAllUsers Usecase', () {
    test('Should return a List of UserEntities', () {
      var result = getAllUsersUseCase();
      expect(result, isInstanceOf<Future<List<UserEntity>>>());
    });
  });
}
