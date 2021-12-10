import 'package:unique_login/domain/entities/user_entity.dart';

abstract class LogInUserUseCase {
  bool? call(String _email, String _password) {}
}
