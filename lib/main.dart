import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikncodes_mt/Screens/loginpage.dart';
import 'package:vikncodes_mt/controller/login_controller.dart';
import 'package:vikncodes_mt/controller/sales_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(future: SharedPreferences.getInstance(),
    builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.done){
        return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<LoginController>(
              create: (context) => LoginController(),
            ),
            ChangeNotifierProvider<SalesController>(create: (context) => SalesController(),)
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: Login(),
    );
      }
      else{
        return CircularProgressIndicator();
      }
    },);
  }
}
