import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes_mt/Screens/filter.dart';
import 'package:vikncodes_mt/const.dart';
import 'package:vikncodes_mt/controller/sales_controller.dart';

class Salespage extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  Salespage({super.key});

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Provider.of<SalesController>(context, listen: false).pagination();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Consumer<SalesController>(
        builder: (context, sales, child) {
          return Column(
            children: [
              SizedBox(
                height: 72.h,
              ),
              Row(
                children: [
                  Gap(18.w),
                 IconButton(onPressed: () {
                   Navigator.pop(context);
                 }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                  Gap(12.w),
                  Text(
                    "Invoices",
                    style: font16weight500colorwhite,
                  )
                ],
              ),
              Gap(18.h),
              const Divider(
                color: Color(0xff1C3347),
              ),
              Gap(16.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Filter(),
                    ),
                  );
                },
                child: Container(
                  height: 38.h,
                  width: 143.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: const Color(0xff1B2B30),
                  ),
                  child: Row(
                    children: [
                      Gap(16.w),
                      Image.asset(
                        "$imgPath/filter.png",
                        width: 24.w,
                        height: 24.h,
                      ),
                      Gap(8.w),
                      Text(
                        "Add Filters",
                        style: font15weight400colorwhite,
                      ),
                    ],
                  ),
                ),
              ),
              Gap(17.h),
              const Divider(
                color: Color(0xff1C3347),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: sales.salesData.length + (sales.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == sales.salesData.length) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final sale = sales.salesData[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 31.w, right: 34.w),
                      child: Container(
                        color: Colors.black,
                        width: 387.w,
                        height: 57.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${sale.voucherNo}",
                                  style: font13weight400colorwhite,
                                ),
                                Text(
                                  "${sale.customerName}",
                                  style: font14weight500colorwhite,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${sale.status}",
                                  style: sale.status == 'Invoiced'
                                      ? font13weight400color1C60E2
                                      : sale.status == 'Pending'
                                          ? font13weight400colorE81C1C
                                          : font13weight400color7D7D7D,
                                ),
                                Text(
                                  "${sale.grandTotalRounded}",
                                  style: font13weight400colorwhite,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
