import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vikncodes_mt/const.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Column(
        children: [
          SizedBox(
            height: 72.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.w, right: 26.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Gap(12.w),
                    Text(
                      "Filters",
                      style: font16weight500colorwhite,
                    )
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      "$imgPath/eye.png",
                      width: 24.w,
                      height: 24.h,
                    ),
                    Gap(30.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Filter",
                        style: font14weight400colorsblue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Gap(18.h),
          Divider(
            color: Color(0xff1C3347),
          ),
          Gap(18.h),
          Container(
            child: Row(
              children: [
                Gap(15.w),
                Text(
                  "This Month",
                  style: font15weight400colorwhite,
                ),
                Gap(15.w),
                Image.asset(
                  "$imgPath/down.png",
                  width: 12.w,
                  height: 6.h,
                )
              ],
            ),
            height: 35.h,
            width: 138.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(41.r),
                color: Color(0XFF07111B)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.w, right: 61.w, top: 18.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 38.h,
                    width: 148.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: Color(0XFF1B2B30)),
                    child: Row(
                      children: [
                        Gap(16.w),
                        Image.asset(
                          "$imgPath/calendar.png",
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(9.w),
                        Text(
                          "12/09/2023",
                          style: font15weight400colorwhite,
                        )
                      ],
                    ),
                  ),
                ),
                Gap(13.w),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 38.h,
                    width: 148.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: Color(0XFF1B2B30)),
                    child: Row(
                      children: [
                        Gap(16.w),
                        Image.asset(
                          "$imgPath/calendar.png",
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(9.w),
                        Text(
                          "12/09/2023",
                          style: font15weight400colorwhite,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Gap(17.h),
          Divider(
            color: Color(0xff1C3347),
          ),
          Padding(
            padding: EdgeInsets.only(left: 27.w, right: 25.w, top: 25.h),
            child: Row(
              children: [
                Filter_box(
                  textdetails: "Pending",
                  containercolor: Color(0XFF0E74F4),
                ),
                Gap(16.w),
                Filter_box(
                  textdetails: "Invoiced",
                  containercolor: Color(0XFF1B2B30),
                ),
                Gap(16.w),
                Filter_box(
                  textdetails: "Cancelled",
                  containercolor: Color(0XFF1B2B30),
                )
              ],
            ),
          ),
          Gap(25.h),
          Padding(
            padding: EdgeInsets.only(left: 27.w, right: 27.w),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                  hintText: "Customer",
                  hintStyle: font15weight400colorslightash,
                  suffixIcon: Image.asset(
                    "$imgPath/arrowdown.png",
                    height: 12.h,
                    width: 6.w,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r))),
            ),
          ),
          Gap(22.h),
          Divider(
            color: Color(0xff1C3347),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 27.w, top: 20.h),
                child: Container(
                  height: 47.h,
                  width: 185.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(41.r),
                      color: Color(0XFF1B2B30)),
                  child: Row(
                    children: [
                      Gap(15.w),
                      Text(
                        "savad farooque",
                        style: font15weight400colorwhite,
                      ),
                      Gap(15.w),
                      Image.asset(
                        "$imgPath/cancel.png",
                        width: 14.w,
                        height: 14.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Filter_box extends StatelessWidget {
  const Filter_box({
    super.key,
    required this.textdetails,
    required this.containercolor,
  });
  final String textdetails;
  final Color containercolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43.h,
      width: 115.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r), color: containercolor),
      child: Center(
          child: Text(
        textdetails,
        style: font14weight500colorwhite,
      )),
    );
  }
}
