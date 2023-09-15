import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unjukketrampilan/core/context.dart';
import 'package:unjukketrampilan/core/route/bloc_route.dart';
import 'package:unjukketrampilan/core/route/route_page.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        title: 'Fish Seller',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorObservers: [routeObserver],
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        scaffoldMessengerKey: snackbarKey,
        home: AppPage(navigatorKey: _navigatorKey),
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  const AppPage({
    Key? key,
    required GlobalKey<NavigatorState> navigatorKey,
  })  : _navigatorKey = navigatorKey,
        super(key: key);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return RouteBloc().pop();
      },
      child: StreamBuilder<List<RoutePage>>(
          stream: RouteBloc().pages.stream,
          initialData: RouteBloc().pages.value,
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return Navigator(
                key: _navigatorKey,
                observers: [HeroController()],
                pages: const [
                  // MaterialPage(child: LoginPage()),
                ],
                onPopPage: (route, result) {
                  return route.didPop(result);
                },
              );
            }
            return Navigator(
              key: _navigatorKey,
              observers: [HeroController()],
              pages: data.map((e) => e.page).toList(),
              onPopPage: (route, result) {
                return route.didPop(result);
              },
            );
          }),
    );
  }
}
