import 'package:flutter/material.dart';
import 'package:unjukketrampilan/modules/homepage/screen/page_login.dart';
import 'package:unjukketrampilan/modules/login/screen/page_login.dart';
import 'package:unjukketrampilan/modules/register/screen/page_login.dart';

abstract class RoutePage {
  final MaterialPage page;
  final bool isProtected;
  final String name;
  RoutePage(this.page, this.name, {this.isProtected = false});
}

// class RouteUiPage extends RoutePage {
//   RouteUiPage()
//       : super(
//           const MaterialPage(child: UiPage()),
//           'UI PAGE',
//         );
// }

class RouteLogin extends RoutePage {
  RouteLogin()
      : super(
          const MaterialPage(child: LoginPage()),
          'login',
        );
}

class RouteRegister extends RoutePage {
  RouteRegister()
      : super(
          const MaterialPage(child: RegisterPage()),
          'register',
        );
}

class RouteHome extends RoutePage {
  RouteHome()
      : super(
          const MaterialPage(child: HomePage()),
          'home',
        );
}
