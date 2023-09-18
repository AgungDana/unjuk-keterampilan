import 'package:flutter/material.dart';
import 'package:unjukketrampilan/modules/dashboard/screen/page_dashboard.dart';

abstract class RoutePage {
  final MaterialPage page;
  final bool isProtected;
  final String name;
  RoutePage(this.page, this.name, {this.isProtected = false});
}

class RouteDashboard extends RoutePage {
  RouteDashboard()
      : super(
          const MaterialPage(child: DashboardPage()),
          '/dashboard',
        );
}
