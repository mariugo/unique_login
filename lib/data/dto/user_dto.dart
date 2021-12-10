import '/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  final int newId;
  final String newName;
  final String newUsername;
  final String newEmail;
  final String newPhone;
  final String newWebsite;

  UserDto({
    required this.newId,
    required this.newName,
    required this.newUsername,
    required this.newEmail,
    required this.newPhone,
    required this.newWebsite,
  }) : super(
          id: newId,
          name: newName,
          username: newUsername,
          email: newEmail,
          phone: newPhone,
          website: newWebsite,
        );

  factory UserDto.fromMap(Map _map) => UserDto(
        newId: _map['id'],
        newName: _map['name'],
        newUsername: _map['username'],
        newEmail: _map['email'],
        newPhone: _map['phone'],
        newWebsite: _map['website'],
      );
}
