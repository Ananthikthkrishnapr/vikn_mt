import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vikncodes_mt/Screens/SaleList.dart';
import 'package:vikncodes_mt/const.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 29.w),
        child: Column(
          children: [
            SizedBox(
              height: 63.h,
            ),
            Row(
              children: [
                Image.asset(
                  "$imgPath/dashboardicon.png",
                  width: 29.w,
                  height: 31.h,
                ),
                Gap(11.w),
                Text(
                  "CabZing",
                  style: font22weight600colorwhite,
                ),
                Gap(172.w),
                Image.asset(
                  "$imgPath/dp.png",
                  width: 61.w,
                  height: 61.h,
                )
              ],
            ),
            Gap(15.h),
            Image.asset("$imgPath/graph.png"),
            Gap(21.h),
            DashboardWidget(
              imageAddress: "$imgPath/bookings.png",
              title: "Bookings",
              count: "123",
              type: "Reserved",
              color: Colors.white,
            ),
            Gap(9.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Salespage(),
                    ));
              },
              child: DashboardWidget(
                imageAddress: "$imgPath/invoice.png",
                title: "Bookings",
                count: "123",
                type: "Reserved",
                color: Color(0XFFA9C9C5),
              ),
            )
          ],
        ),
      ),
      
     
    );
  }
}

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.count,
    required this.type,
    required this.color,
    required this.imageAddress,
  });
  final void Function()? onTap;
  final String title;
  final String count;
  final String type;
  final Color color;
  final String imageAddress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 129.h,
        width: 373.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Color(0xff131313)),
        child: Padding(
          padding: EdgeInsets.only(
            left: 19.w,
            right: 29.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset(
                      imageAddress,
                      width: 18.w,
                      height: 18.h,
                    ),
                    height: 92.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: color),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 28.h, left: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: color),
                        ),
                        Text(
                          count,
                          style: font22weight400colorwhite,
                        ),
                        Text(
                          type,
                          style: font14weight400colorhash,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
