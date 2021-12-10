@Timeout(Duration(seconds: 5))

import 'package:flutter_test/flutter_test.dart';
import 'package:unique_login/domain/entities/user_entity.dart';

main() {
  group('Testing UserEntity', () {
    test('Should return an instance of UserEntity', () {
      var user = UserEntity(
        id: 1,
        name: 'Mariugo',
        username: 'mariugo',
        email: 'mariugo@mariugo.com',
        phone: '123-1231-156',
        website: 'www.mariugo.com',
      );
      expect(user, isNotNull);
    });

    test('Should return an email with @', () {
      var user = UserEntity(
        id: 1,
        name: 'Mariugo',
        username: 'mariugo',
        email: 'mariugo@mariugo.com',
        phone: '123-1231-156',
        website: 'www.mariugo.com',
      );
      expect(user.email.contains('@'), true);
    });

    test('Should return a name longer than 3 characters', () {
      var user = UserEntity(
        id: 1,
        name: 'Mariugo',
        username: 'mariugo',
        email: 'mariugo@mariugo.com',
        phone: '123-1231-156',
        website: 'www.mariugo.com',
      );
      expect(user.name.length > 3, true);
    });

    test('Should return a website containing www', () {
      var user = UserEntity(
        id: 1,
        name: 'Mariugo',
        username: 'mariugo',
        email: 'mariugo@mariugo.com',
        phone: '123-1231-156',
        website: 'www.mariugo.com',
      );
      expect(user.website.contains('www'), true);
    });
  });
}
