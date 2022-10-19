import 'package:chaika_test/domain/api/api.dart';
import 'package:chaika_test/domain/entity/account_info.dart';

class AccountService {
  final Api _api = Api();
  late AccountInfo accountInfo;

  void loadInfo() {
    accountInfo = AccountInfo.fromJson(_api.getAccountInfo());
  }
}
