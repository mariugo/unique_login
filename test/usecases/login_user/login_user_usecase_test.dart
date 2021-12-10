@Timeout(Duration(seconds: 5))

import 'package:flutter_test/flutter_test.dart';
import 'package:unique_login/usecases/login_user/log_in_user_imp.dart';
import 'package:unique_login/usecases/login_user/log_in_user_usecase.dart';

main() {
  group('Testing Login User Usecase', () {
    test('Should be able to login', () {
      LogInUserUseCase logInUserUseCase = LogInUserUseCaseImp();
      var result = logInUserUseCase('teste@teste.com.br', '123456789+');
      expect(result, true);
    });

    test('Should NOT be able to login', () {
      LogInUserUseCase logInUserUseCase = LogInUserUseCaseImp();
      var result = logInUserUseCase('teste@teste.com.br', '123');
      expect(result, false);
    });
  });
}
