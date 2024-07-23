import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:vikncodes_mt/const.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Padding(
        padding: EdgeInsets.only(left: 18.w),
        child: Column(
          children: [
            SizedBox(
              height: 63.h,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 19.w,
                      top: 20.h,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Image.asset(
                            "$imgPath/propic.png",
                            height: 73.h,
                            width: 55.w,
                          ),
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33.r),
                            color: Color(0xff000000),
                          ),
                        ),
                        Gap(19.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "David Arnold",
                              style: font20weight500colorwhite,
                            ),
                            Text(
                              "david012@cabzing",
                              style: font14weight500colorskyblue,
                            ),
                          ],
                        ),
                        Gap(59.w),
                        Image.asset(
                          "$imgPath/edit.png",
                          width: 24.w,
                          height: 24.h,
                        )
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w, right: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33.r),
                              color: Color(0XFF000000)),
                          width: 170.w,
                          height: 107.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Gap(16.w),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Image.asset(
                                    "$imgPath/stars.png",
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                                height: 92.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xffB5CDFE)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h, left: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "4.3",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),Image.asset("$imgPath/star.png",width: 12.w,height: 12.h,)
                                      ],
                                    ),
                                    Text(
                                      "2,211",
                                      style: font14weight400colorslightblack,
                                    ),
                                    Text(
                                      "rides",
                                      style: font14weight400colorslightblue,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33.r),
                              color: Color(0XFF000000)),
                          width: 170.w,
                          height: 107.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Gap(16.w),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.all(8.h),
                                  child: Image.asset(
                                    "$imgPath/kyc.png",
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                                height: 92.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Color(0xffBA9C9C5)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h, left: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "KYC",
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),Gap(2.w),
                                        Image.asset("$imgPath/tick.png",width: 10.w,height: 10.h,)
                                      ],
                                    ),Gap(5.h),
                                    Text(
                                      "Verified",
                                      style: font14weight400colorslightgreen,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(19.h),
                  Container(
                    child: Row(
                      children: [
                        Gap(135.w),
                        Image.asset(
                          "$imgPath/logout.png",
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(8.w),
                        Text(
                          "Logout",
                          style: font15weight400colorsred,
                        )
                      ],
                    ),
                    height: 67.h,
                    width: 352.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(174.r),
                        color: Color(0XFF040404)),
                  )
                ],
              ),
              height: 352.h,
              width: 388.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44.r),
                  color: Color.fromARGB(255, 35, 35, 35)),
            ),
            Gap(35.h),
            Container(
              height: 333.h,
              width: 329.w,
              child: Column(
                children: [
                  Profile_cards(
                    imageaddress: "$imgPath/help.png",
                    textdetails: "Help",
                  ),
                  Gap(49.h),
                  Profile_cards(
                    imageaddress: "$imgPath/faq.png",
                    textdetails: "FAQ",
                  ),
                  Gap(49.h),
                  Profile_cards(
                    imageaddress: "$imgPath/invite.png",
                    textdetails: "Invite Friends",
                  ),
                  Gap(49.h),
                  Profile_cards(
                    imageaddress: "$imgPath/service.png",
                    textdetails: "Terms of service",
                  ),
                  Gap(49.h),
                  Profile_cards(
                    imageaddress: "$imgPath/privacy.png",
                    textdetails: "Privacy Policy",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Profile_cards extends StatelessWidget {
  const Profile_cards({
    super.key,
    required this.imageaddress,
    required this.textdetails,
  });
  final String imageaddress;
  final String textdetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              imageaddress,
              height: 24.h,
              width: 24.w,
            ),
            Gap(14.w),
            Text(
              textdetails,
              style: font15weight400colorwhite,
            ),
          ],
        ),
        Image.asset(
          "$imgPath/icon.png",
          height: 24.h,
          width: 24.w,
        )
      ],
    );
  }
}
