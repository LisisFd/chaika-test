import 'package:chaika_test/ui/decoration/ui_decoration.dart';
import 'package:chaika_test/ui/transaction_detail/transaction_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
part 'widgets/header_widget.dart';
part 'widgets/body_widget.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.blue,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: UiDecorationColors.defaultAppColor,
      body: Column(
        children: const [
          _HeaderWidget(),
          _BodyWidget(),
        ],
      ),
    );
  }
}
