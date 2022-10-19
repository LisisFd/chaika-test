import 'package:chaika_test/domain/entity/account_info.dart';
import 'package:chaika_test/domain/entity/transaction.dart';
import 'package:chaika_test/domain/extentions/date_time_extention.dart';
import 'package:chaika_test/domain/service/account_service.dart';
import 'package:chaika_test/domain/service/points_service.dart';
import 'package:chaika_test/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

part 'transactions_list_view_model.dart';
part 'transaction_row_model.dart';

class TransactionsListModel {
  final AccountService _accountService = AccountService();
  late final TransactionsListViewModel transactionsListViewModel;

  TransactionsListModel() {
    _accountService.loadInfo();
    transactionsListViewModel =
        TransactionsListViewModel.fromAccountInfo(_accountService.accountInfo);
  }

  void onTransactionTap(BuildContext context, int id) {
    Navigator.pushNamed(
        context, MainNavigationRouteNames.transactionDetailScreen,
        arguments: id);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
