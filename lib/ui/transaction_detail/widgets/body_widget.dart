part of '../transaction_detail_screen.dart';

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel =
        context.read<TransactionDetailModel>().transactionDetailViewModel;

    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: UiDecoration.cardInfoDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status: ${viewModel.status}',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            Text(
              viewModel.overview,
              style: TextStyle(fontSize: 19.sp, color: Colors.grey),
            ),
            Container(
              margin: EdgeInsets.only(top: 15.h),
              padding: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey.withOpacity(0.3))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500)),
                  Text(viewModel.amount,
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w500))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
