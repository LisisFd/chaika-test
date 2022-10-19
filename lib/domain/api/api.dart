import 'package:chaika_test/domain/test_response.dart';

class Api {
  Map<String, dynamic> getAccountInfo() {
    return TestResponse().accountInfo;
  }
}
