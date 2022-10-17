import 'package:chaika_test/ui/transactions_list/transactions_list_screen.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const transactionsListScreen = '/';
  static const transactionDetailScreen = "/transactionDetailScreen";

}

class MainNavigation {

  final Map<String, Widget Function(BuildContext)> routes = {
    MainNavigationRouteNames.transactionsListScreen: (context) =>
       const TransactionsListScreen(),

  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        const widget = Text("Navigation error");
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
