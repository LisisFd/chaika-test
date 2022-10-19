import 'package:chaika_test/ui/transaction_detail/transaction_detail_model.dart';
import 'package:chaika_test/ui/transaction_detail/transaction_detail_screen.dart';
import 'package:chaika_test/ui/transactions_list/models/transactions_list_model.dart';
import 'package:chaika_test/ui/transactions_list/transactions_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class MainNavigationRouteNames {
  static const transactionsListScreen = '/';
  static const transactionDetailScreen = "/transactionDetailScreen";
}

class MainNavigation {
  final Map<String, Widget Function(BuildContext)> routes = {
    MainNavigationRouteNames.transactionsListScreen: (context) => Provider(
          create: (_) => TransactionsListModel(),
          child: const TransactionsListScreen(),
        )
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.transactionDetailScreen:
        final id = settings.arguments as int;
        return MaterialPageRoute(
            builder: (context) => Provider(
                  create: (_) => TransactionDetailModel(transactionId: id),
                  child: const TransactionDetailScreen(),
                ));
      default:
        const widget = Text("Navigation error");
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
