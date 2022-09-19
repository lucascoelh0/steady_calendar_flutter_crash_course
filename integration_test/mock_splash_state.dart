import 'package:crash_couse_advanced/screens/splash/splash_state.dart';

class MockSplashState extends SplashState {
  MockSplashState();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      logout(context);
    });
  }
}
