import 'package:flutter/material.dart';

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
          const MaterialPage(child: Scaffold()),
          'login',
        );
}

// class RouteRegister extends RoutePage {
//   RouteRegister()
//       : super(
//           const MaterialPage(child: RegisterPage()),
//           'register',
//         );
// }

class RouteHome extends RoutePage {
  RouteHome()
      : super(
          const MaterialPage(child: Scaffold()),
          'home',
        );
}
