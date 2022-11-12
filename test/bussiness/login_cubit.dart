import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testiing/bussiness/login_cubt/login_cubit.dart';
import 'package:flutter_testiing/data/repo_interface.dart';

void main() {
  late LoginCubit loginCubit;

  setUp(() {
    var repo = IRepository.fake();
    loginCubit = LoginCubit(repo);
  });

  group('login method', () {
    test("description", () async {
      final res = loginCubit.login(
        email: "test@test.com",
        password: "Ab123456",
      );

      expectLater(res, completion('success'));
    });
  });
}
