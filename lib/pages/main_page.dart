import 'package:ajuda_5_modul_exap/pages/main_pages/home.dart';
import 'package:d_navigation_bar/d_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final DNavigationBarController controller = DNavigationBarController(pages: _pages);
  static const List<Widget> _pages = [HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.page,
      bottomNavigationBar: DNavigationBar(
        onChanged: (index) => setState(() {}),
        controller: controller,
        useShadow: false,
        items: [
          DNavigationBarItem(
            icon: SvgPicture.asset('assest/icons/home.svg', color: const Color(0xff818898)),
            activeIcon: SvgPicture.asset('assest/icons/home.svg'),
          ),
          DNavigationBarItem(
            icon: SvgPicture.asset('assest/icons/home.svg', color: const Color(0xff818898)),
            activeIcon: SvgPicture.asset('assest/icons/home.svg'),
          ),
          DNavigationBarItem(
            icon: SvgPicture.asset('assest/icons/home.svg', color: const Color(0xff818898)),
            activeIcon: SvgPicture.asset('assest/icons/home.svg'),
          ),
          DNavigationBarItem(
            icon: SvgPicture.asset('assest/icons/home.svg', color: const Color(0xff818898)),
            activeIcon: SvgPicture.asset('assest/icons/home.svg'),
          ),
        ],
      ),
    );
  }
}
