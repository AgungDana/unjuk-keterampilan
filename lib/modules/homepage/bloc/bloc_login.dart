import 'package:flutter/foundation.dart';
import 'package:sstream/sstream.dart';

import 'package:unjukketrampilan/core/auth/bloc/bloc_auth.dart';
import 'package:unjukketrampilan/core/auth/bloc/event.dart';
import 'package:unjukketrampilan/core/auth/model/token.dart';
import 'package:unjukketrampilan/modules/login/model/error/error_login.dart';
import 'package:unjukketrampilan/modules/login/model/input/input_login.dart';

class LoginBLoc {
  LoginBLoc() {
    if (kDebugMode) {
      email.add('cobaseller@gmail.com');
      password.add('cobaseller');
    }
  }


  final email = "".stream;
  final password = "".stream;

  Future<void> login() async {
    try {
      final emailVal = email.value;
      if (emailVal == '') {
        throw LoginError();
      }
      final passVal = password.value;
      if (passVal == '') {
        throw LoginError();
      }
      
      AuthBloc().raise(EventAuthLogin(AuthToken(token: 'token')));
    } catch (e) {
      rethrow;
    }
  }
}
