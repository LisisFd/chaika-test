part of '../transaction_detail_screen.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel =
        context.read<TransactionDetailModel>().transactionDetailViewModel;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        viewModel.amount,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.sp),
      ),
      Text(
        viewModel.name,
        style: TextStyle(color: Colors.grey, fontSize: 19.sp),
      ),
      Text(viewModel.transactionTime,
          style: TextStyle(color: Colors.grey, fontSize: 19.sp)),
    ]);
  }
}
