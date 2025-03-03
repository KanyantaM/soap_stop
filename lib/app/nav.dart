import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soap_stop/screens/home_screen.dart';
import 'package:soap_stop/screens/order_history_screen.dart';
import 'package:soap_stop/screens/profile_screen.dart';
import 'package:soap_stop/widgets/laoding_widget.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: Icon(Icons.person, color: Colors.white)),
          title: const Text(
            'Soap Stop',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            SoapStopLoadingWidget(),
            OrderHistoryScreen(),
          ],
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                offset: const Offset(0, -4),
                blurRadius: 8.0,
              ),
            ],
          ),
          child: WaterDropNavBar(
            waterDropColor: Colors.blue,
            backgroundColor: Colors.white,
            onItemSelected: (index) {
              setState(() => _selectedIndex = index);
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutQuad);
            },
            selectedIndex: _selectedIndex,
            barItems: [
              BarItem(
                filledIcon: Icons.home_rounded,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                filledIcon: Icons.local_shipping,
                outlinedIcon: Icons.local_shipping_outlined,
              ),
              BarItem(
                filledIcon: Icons.history_rounded,
                outlinedIcon: Icons.history_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
