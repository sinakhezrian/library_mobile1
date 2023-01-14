import 'package:get/get.dart';
import 'package:library_mobile/screens/AddBookScreen.dart';
import 'package:library_mobile/screens/homeScreen.dart';

class Routes {
  static List<GetPage> get getPages => [
        GetPage(
          name: '/addBook',
          page: () => const AddBookScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/homeScreen',
          page: () => const HomeScreen(),
          transition: Transition.fadeIn,
        ),
      ];
}
