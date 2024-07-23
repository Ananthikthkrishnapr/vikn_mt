import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vikncodes_mt/Screens/filter.dart';
import 'package:vikncodes_mt/const.dart';

class Salespage extends StatefulWidget {
  const Salespage({super.key});

  @override
  State<Salespage> createState() => SalespageState();
}

class SalespageState extends State<Salespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Column(
        children: [
          SizedBox(
            height: 72.h,
          ),
          Row(
            children: [Gap(18.w),
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Gap(12.w),
              Text(
                "Invoices",
                style: font16weight500colorwhite,
              )
            ],
          ),
          Gap(18.h),
          Divider(
            color: Color(0xff1C3347),
          ),
          Gap(16.h),
          GestureDetector(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Filter(),));
          },
            child: Container(
              child: Row(
                children: [
                  Gap(16.w),
                  Image.asset(
                    "$imgPath/filter.png",
                    width: 24.w,
                    height: 24.h,
                  ),
                  Text(
                    "Add Filters",
                    style: font15weight400colorwhite,
                  )
                ],
              ),
              height: 38.h,
              width: 143.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: Color(0xff1B2B30)),
            ),
          ),
          Gap(17.h),
          Divider(
            color: Color(0xff1C3347),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 31.w,right: 34.w),
                  child: Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("#Invoice No", style: font13weight400colorwhite),
                            Text(
                              "Customer Name",
                              style: font14weight500colorwhite,
                            )
                          ],
                        ),Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Pending", style: font13weight400colorwhite),
                            Text("SAR. 10,000.00", style: font13weight400colorwhite),
                          ],
                        ),
                      ],
                    ),
                    color: Colors.black,
                    width: 387.w,
                    height: 57.h,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
