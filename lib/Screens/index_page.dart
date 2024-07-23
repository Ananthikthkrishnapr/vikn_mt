import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vikncodes_mt/Screens/Profile.dart';
import 'package:vikncodes_mt/Screens/dashboard.dart';
import 'package:vikncodes_mt/Screens/page2.dart';
import 'package:vikncodes_mt/Screens/page3.dart';
import 'package:vikncodes_mt/const.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      Dashboard(),
      Page2(),
      Page3(),
      Profile(),
    ];
    
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0 ?
            Column(
              children: [
                Image.asset("$imgPath/home.png", width: 28.w, height: 28.h),
                Gap(11.h),
                Image.asset("$imgPath/dot.png", width: 7.w, height: 7.h),
              ],
            ):Image.asset("$imgPath/homeblack.png", width: 28.w, height: 28.h),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1 ?
            Column(
              children: [
                Image.asset("$imgPath/route.png", width: 28.w, height: 28.h),
                Gap(11.h),
                Image.asset("$imgPath/dot.png", width: 7.w, height: 7.h),
              ],
            ):Image.asset("$imgPath/route.png", width: 28.w, height: 28.h),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2 ?
            Column(
              children: [
                Image.asset("$imgPath/notification.png", width: 28.w, height: 28.h),
                Gap(11.h),
                Image.asset("$imgPath/dot.png", width: 7.w, height: 7.h),
              ],
            ):Image.asset("$imgPath/notification.png", width: 28.w, height: 28.h),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3 ?
            Column(
              children: [
                Image.asset("$imgPath/profilewhite.png", width: 28.w, height: 28.h),
                Gap(11.h),
                Image.asset("$imgPath/dot.png", width: 7.w, height: 7.h),
              ],
            ):Image.asset("$imgPath/profile.png", width: 28.w, height: 28.h),
            label: "",
          ),
        ],
      ),
    );
  }
}
