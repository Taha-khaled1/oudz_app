import 'package:get/get.dart';
import 'package:oudz_app/presentation_layer/screen/home_screen/home_screen.dart';

List<GetPage<dynamic>>? getPage = [
  // GetPage(
  //     name: Routes.welcomRoute,
  //     page: () => const WelcomeScreen(),
  //     middlewares: [
  //       Midelware(),
  //     ]),
  GetPage(
    name: '/',
    page: () => const HomeScreen(),
  ),
  // GetPage(
  //   name: Routes.PropertyDetalisScreen,
  //   page: () => const PropertyDetalisScreen(),
  // ),
  // GetPage(
  //   name: Routes.addproperty,
  //   transition: Transition.fadeIn,
  //   page: () => AddProperty(),
  // ),
// GetPage(
//   name: "/secondPage",
//   transition: Transition.fadeIn,
//   page: SecondPage(),
// ),
// GetPage(
//   name: "/secondPage",
//   transition: Transition.fadeIn,
//   page: SecondPage(),
// ), https://mega.nz/file/1SZyzZrR#Tr2KEhLgCPxOLyFae0P7H7A94S6tgHq3ZSW1ZZTxTss
];
