part of '../transactions_list_screen.dart';

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<TransactionsListModel>();
    final transactions = model.transactionsListViewModel.transactions;
    return Padding(
      padding: EdgeInsets.only(top: 25.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          S.of(context).latest_transaction,
          style: TextStyle(fontSize: 27.sp, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(top: 10.h),
              decoration: UiDecoration.cardInfoDecoration,
              child: ListView.builder(
                itemExtent: 100,
                padding: EdgeInsets.only(left: 15.w),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return _ListItemWidget(
                    transactionRowModel: transaction,
                    onTap: () =>
                        model.onTransactionTap(context, transaction.id),
                  );
                },
              )),
        ),
      ]),
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  final TransactionRowModel transactionRowModel;
  final Function() onTap;

  const _ListItemWidget(
      {Key? key, required this.transactionRowModel, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.only(top: 10.h, right: 10.w, bottom: 10.w),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.2)))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const _RandomContainer(),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                transactionRowModel.name,
                                style: TextStyle(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(transactionRowModel.amount,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                )),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey.withOpacity(0.5),
                              size: 24.w,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 40.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  transactionRowModel.overview,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.grey,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              transactionRowModel.cashBack == null
                                  ? const SizedBox.shrink()
                                  : Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      color: const Color.fromRGBO(
                                          242, 242, 247, 1),
                                      child: Text(
                                        transactionRowModel.cashBack!,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16.sp),
                                      )),
                            ],
                          ),
                        ),
                        Text(transactionRowModel.timeTransaction,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            splashColor: const Color.fromRGBO(0, 0, 0, 0.1),
            highlightColor: const Color.fromRGBO(0, 0, 0, 0.1),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}

class _RandomContainer extends StatelessWidget {
  const _RandomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    Color tempColor = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: ColoredBox(
        color: tempColor,
        child: ColoredBox(
          color: Colors.black.withOpacity(0.5),
          child: SizedBox(
            width: 55.w,
            height: 55.w,
            child: const Center(
                child: Icon(
              Icons.shop,
              color: Colors.white,
            )),
          ),
        ),
      ),
    );
  }
}
