part of '../transactions_list_screen.dart';

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: ListView(
              itemExtent: 100,
              padding: EdgeInsets.only(left: 15.w),
              children: const [
                _ListItemWidget(),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  const _ListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const link =
        "https://yt3.ggpht.com/ytc/AMLnZu8W4zHc3gYJmK1Z8U1HCuZOdRpr1YaGhOEpr9ek3w=s900-c-k-c0x00ffffff-no-rj";
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
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      image: const NetworkImage(
                        link,
                      ),
                      width: 55.w,
                    )),
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
                                'Payment',
                                style: TextStyle(
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("\$14.06",
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
                                  'sdfdssdfsdfsdfsdfssdsdfdsfsddddddddd',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.grey,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                  color: const Color.fromRGBO(242, 242, 247, 1),
                                  child: Text(
                                    '3%',
                                    style: TextStyle(color: Colors.grey,fontSize: 16.sp),
                                  )),
                            ],
                          ),
                        ),
                        Text('Tusday',
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
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
