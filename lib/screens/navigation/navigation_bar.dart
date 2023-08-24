import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rckdu/screens/home/home.dart';
import 'package:rckdu/screens/news/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBarBottom extends StatefulWidget {
  const NavigationBarBottom({super.key});

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('https://akademis-gariste.eu/'),
    Text('https://akademis-cingrija.eu/'),
    Text('https://rckdu.hr/'),
    NewsScreen(),
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        setState(() {
          _selectedIndex = index;
        });
        break;
      case 1:
        launchUrl(
          Uri.parse('https://akademis-gariste.eu/'),
          mode: LaunchMode.externalApplication,
        );
        break;
      case 2:
        launchUrl(
          Uri.parse('https://akademis-cingrija.eu/'),
          mode: LaunchMode.externalApplication,
        );
        break;
      case 3:
        launchUrl(
          Uri.parse('https://rckdu.hr/'),
          mode: LaunchMode.externalApplication,
        );
        break;
      case 4:
        setState(() {
          _selectedIndex = index;
        });
        break;
      default:
        setState(() {
          _selectedIndex = index;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset('assets/images/homeicon.svg'),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset('assets/images/activehomeicon.svg'),
            ),
            label: 'navBarHome'.tr(),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset('assets/images/garisteicon.svg'),
            ),
            label: 'Garište',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset('assets/images/cingrijaicon.svg'),
            ),
            label: 'Čingrija',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset('assets/images/rckduicon.svg'),
            ),
            label: 'RCK DU',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset('assets/images/newsicon.svg'),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SvgPicture.asset('assets/images/activenewsicon.svg'),
            ),
            label: 'navBarNews'.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(193, 2, 48, 1),
        unselectedItemColor: Colors.black,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
