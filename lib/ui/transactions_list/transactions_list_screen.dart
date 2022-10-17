
import 'package:chaika_test/generated/l10n.dart';
import 'package:chaika_test/ui/decoration/ui_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
part 'widgets/header_widget.dart';
part 'widgets/body_widget.dart';

class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242,242,247,1),
      body: Padding(
        padding:  EdgeInsets.only(left: 20.w,right:20.w,top:40.h),
        child: Column(
          children: const [_HeaderWidget(),Expanded(child: _BodyWidget())],
        ),
      ),
    );
  }
}
