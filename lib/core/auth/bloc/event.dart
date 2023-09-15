import 'package:unjukketrampilan/core/auth/model/token.dart';

abstract class AuthEvent {}

class EventAuthLogin extends AuthEvent {
  AuthToken token;
  EventAuthLogin(
    this.token,
  );
}

class EventAuthLogout extends AuthEvent {}
