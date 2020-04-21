import 'package:flutter/foundation.dart';
import 'package:rebot/login/repository/authentication.dart';
import 'package:rebot/login/repository/user_repository.dart';

import 'access_token.dart';

class UserRepositoryImpl implements UserRepository {
  final users = [Authentication("moises", "123"),Authentication("engenheiro", "123")];

  Future<AccessToken> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 2));
    this.users.firstWhere(
        (user) => username == user.username && password == user.password);
    return AccessToken();
  }
}
