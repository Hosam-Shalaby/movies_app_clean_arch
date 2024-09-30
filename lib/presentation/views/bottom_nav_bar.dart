import 'package:flutter/material.dart';
import 'package:movies_application/presentation/views/tabs/browse_tab.dart';
import 'package:movies_application/presentation/views/tabs/home_tab.dart';
import 'package:movies_application/presentation/views/tabs/watch_list_tab.dart';
import 'package:movies_application/presentation/widgets/search_bar.dart';
import 'package:movies_application/utls/constant/color_constant.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static const String routeName = 'bottom_nav_bar';
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> tabs = [
    const HomeTab(),
    const SearchBarTab(),
    const BrowseTab(),
    const WatchListTab(),
  ];

  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: tabs[select],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {});
              select = index;
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: ColorConstant.backGroundColor,
                  icon: select == 0
                      ? const Icon(
                          Icons.home,
                          color: Colors.amberAccent,
                          size: 30,
                        )
                      : const Icon(
                          Icons.home,
                          color: ColorConstant.iconBackGroundColor,
                          size: 30,
                        ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: select == 1
                      ? const Icon(
                          Icons.search,
                          color: Colors.amberAccent,
                          size: 30,
                        )
                      : const Icon(Icons.search,
                          size: 30, color: ColorConstant.iconBackGroundColor),
                  label: ''),
              BottomNavigationBarItem(
                  icon: select == 2
                      ? const Icon(
                          Icons.open_in_browser_outlined,
                          color: Colors.amberAccent,
                          size: 30,
                        )
                      : const Icon(Icons.open_in_browser_outlined,
                          size: 30, color: ColorConstant.iconBackGroundColor),
                  label: ''),
              BottomNavigationBarItem(
                  icon: select == 3
                      ? const Icon(
                          Icons.list,
                          color: Colors.amberAccent,
                          size: 30,
                        )
                      : const Icon(Icons.list,
                          size: 30, color: ColorConstant.iconBackGroundColor),
                  label: ''),
            ]));
  }
}
