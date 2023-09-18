import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sstream/sstream.dart';
import 'package:unjukketrampilan/core/auth/bloc/authenticated.dart';
import 'package:unjukketrampilan/core/route/route_page.dart';

class RouteBloc extends Authenticated {
  // private constructor
  RouteBloc._() {
    _state();
  }
  // make singletone
  static final RouteBloc _instance = RouteBloc._();
  factory RouteBloc() {
    return _instance;
  }

  @override
  Future<void> onLogin() async {
    _pageController.add([RouteDashboard()]);
  }

  @override
  Future<void> onLogout() async {
    if (kDebugMode) {
      print(
          '================ROUTE==========================${_currentPages.length}');
    }
    _currentPages
        .removeWhere((element) => element.name == RouteDashboard().name);
    _currentPages.add(RouteDashboard());
    _state();
    if (kDebugMode) {
      print(
          '================ROUTE==========================${_currentPages.length}');
    }
  }

  _state() {
    _pageController.add(_currentPages);
  }

  final List<RoutePage> _currentPages =
      List<RoutePage>.filled(1, RouteDashboard(), growable: true);

  final _pageController = SStream<List<RoutePage>>([]);
  SStream<List<RoutePage>> get pages => _pageController; //state

  push(RoutePage page) {
    final latest = _pageController.value;
    if (page.isProtected) {
      _pageController.add(latest);
      return;
    }
    latest.add(page);
    _pageController.add(latest);
  }

  bool pop() {
    final latest = _pageController.value;
    if (latest.length > 1) {
      latest.removeLast();
      _pageController.add(latest);
      return false;
    }
    return true;
  }

  popThenPush(RoutePage page) {
    pop();
    push(page);
  }
}
