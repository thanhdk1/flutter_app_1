import 'package:get/get.dart';
import 'package:pvoil_station/common/page_manager/route_path.dart';
import 'package:pvoil_station/screen/login/login_page.dart';
import 'package:pvoil_station/screen/splash/splash_page.dart';
import 'package:pvoil_station/screen/home/home_page.dart';

List<GetPage> listPage = [
  GetPage(
      name: RoutePath.INITIAL,
      page: () => SplashPage(),
      transition: Transition.fadeIn),
  GetPage(
      name: RoutePath.LOGIN,
      page: () => LoginPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: RoutePath.HOME,
      page: () => HomePage(),
      transition: Transition.rightToLeft),
];
