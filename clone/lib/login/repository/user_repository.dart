import 'package:flutter/foundation.dart';
import 'access_token.dart';

abstract class UserRepository {

  Future<AccessToken> authenticate({
    @required String username,
    @required String password
  });

}