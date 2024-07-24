// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:vikncodes_mt/Screens/index_page.dart';
// import 'package:vikncodes_mt/Screens/loginpage.dart';
// import 'package:vikncodes_mt/controller/login_controller.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToNextScreen();
//   }

//   Future<void> _navigateToNextScreen() async {
//     final loginModel = Provider.of<LoginController>(context, listen: false);
//     await Future.delayed(Duration(seconds: 2));
//     final isLoggedIn = await loginModel.autoLogin();

//     if (isLoggedIn) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => IndexPage()),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Login()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Text(
//           'VIKN CODES',
//           style: TextStyle(
//               fontSize: 20.sp,
//               fontWeight: FontWeight.w600,
//               color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
