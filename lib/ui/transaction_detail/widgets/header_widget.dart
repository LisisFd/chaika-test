part of '../transaction_detail_screen.dart';

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        '\$7.50',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.sp),
      ),
      Text(
        'Airalo',
        style: TextStyle(color: Colors.grey, fontSize: 19.sp),
      ),
      Text('02/02/0200, 12:47',
          style: TextStyle(color: Colors.grey, fontSize: 19.sp)),
    ]);
  }
}
