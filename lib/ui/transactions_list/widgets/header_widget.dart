part of '../transactions_list_screen.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: const [
                Flexible(child: _CardBalanceWidget()),
                SizedBox(
                  height: 10,
                ),
                Flexible(child: _DailyPointsWidget()),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Flexible(child: _PaymentStatusWidget()),
        ],
      ),
    );
  }
}

class _CardBalanceWidget extends StatelessWidget {
  const _CardBalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = S.of(context).card_balance;
    final model = context.read<TransactionsListModel>();
    final viewModel = model.transactionsListViewModel;
    return Container(
      width: double.infinity,
      decoration: UiDecoration.cardInfoDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              viewModel.cardBalance,
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            Text(viewModel.available,
                style: TextStyle(fontSize: 17.sp, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _DailyPointsWidget extends StatelessWidget {
  const _DailyPointsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = S.of(context).daily_points;
    final model = context.read<TransactionsListModel>();
    final viewModel = model.transactionsListViewModel;
    return Container(
      width: double.infinity,
      decoration: UiDecoration.cardInfoDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500)),
              Text(viewModel.dailyPoints,
                  style: TextStyle(fontSize: 18.sp, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentStatusWidget extends StatelessWidget {
  const _PaymentStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = S.of(context).payment_status_disable;
    final startSubTitle = S.of(context).payment_status_disable_subtitle;
    final endSubTitle = S.of(context).balance;
    final DateTime now = DateTime.now();
    final String month = DateFormat('MMMM').format(now);
    final subtitle = '$startSubTitle $month $endSubTitle';
    return Container(
      decoration: UiDecoration.cardInfoDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
            Text(
              subtitle,
              style: TextStyle(fontSize: 17.sp, color: Colors.grey),
              maxLines: 2,
            ),
            const Expanded(
                child: Align(
                    alignment: Alignment.bottomRight, child: _CheckIcon()))
          ],
        ),
      ),
    );
  }
}

class _CheckIcon extends StatelessWidget {
  const _CheckIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: ColoredBox(
        color: UiDecorationColors.defaultAppColor,
        child: SizedBox(
          width: 80.w,
          height: 80.w,
          child: Center(
              child: Icon(
            Icons.check_rounded,
            color: Colors.black,
            size: 50.w,
          )),
        ),
      ),
    );
  }
}
