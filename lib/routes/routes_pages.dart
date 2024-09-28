import 'package:abc/routes/routes_names.dart';
import 'package:get/get.dart';

import '../screens/homeScreens.dart';
import '../screens/noteView.dart';


class RoutesPages{

  static  List<GetPage<dynamic>>? routes= [
    GetPage(name: RoutesNames.home, page: () => Homescreens(),),
    GetPage(name: RoutesNames.notes_screen, page: () => Noteview(),),


  ];
}