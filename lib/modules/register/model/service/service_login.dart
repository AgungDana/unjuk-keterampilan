import 'package:unjukketrampilan/core/auth/model/token.dart';
import 'package:unjukketrampilan/modules/login/model/input/input_login.dart';

abstract class LoginService {
  Future<AuthToken> login(LoginInput input);
}
