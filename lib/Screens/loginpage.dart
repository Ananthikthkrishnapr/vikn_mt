import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes_mt/Screens/index_page.dart';
import 'package:vikncodes_mt/const.dart';
import 'package:vikncodes_mt/controller/login_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordvisible = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginController>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff000000),
      body: Padding(
        padding: EdgeInsets.only(
          left: 36.w,
          right: 36.w,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 88.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "$imgPath/language.png",
                    width: 24.w,
                    height: 24.h,
                  ),
                  Gap(5.w),
                  Text(
                    "English",
                    style: font15weight400colorwhite,
                  )
                ],
              ),
              Gap(195.h),
              Text("Login", style: font21weight500colorffffff),
              Text("Login to your vikn account",
                  style: font15weight400color838383),
              Gap(27.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.r),
                  color: const Color(0xff08131E),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(
                            "$imgPath/person.png",
                            height: 22.h,
                            width: 22.w,
                          ),
                        ),
                        hintText: "Username",
                        hintStyle: const TextStyle(color: Color(0xff7D7D7D)),
                      ),
                    ),
                    const Divider(
                      color: Color(0xff1C3347),
                    ),
                    Consumer<LoginController>(builder: (context, value, child) {
                      return TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              "$imgPath/key.png",
                              height: 22.h,
                              width: 22.w,
                            ),
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Color(0xff7D7D7D)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              value.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,color: Colors.blue,
                            ),
                            onPressed: () {
                              value.toggleObscureText();
                            },
                          ),
                        ),
                        obscureText: value.obscureText,
                      );
                    }),
                  ],
                ),
              ),
              Gap(29.h),
              Text(
                "Forgotten Password?",
                style: font16weight400colorblue,
              ),
              Gap(35.h),
              Consumer<LoginController>(
                builder: (context, loginModel, child) {
                  return GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        final success = await loginModel.loginUser(
                            username, password, context);

                        if (success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IndexPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Login failed. Please try again.'),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 48.h,
                      width: 125.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120.r),
                        color: Colors.blue,
                      ),
                      child: Row(
                        children: [
                          Gap(22.w),
                          Text(
                            "Sign in",
                            style: font16weight400colorwhite,
                          ),
                          Gap(9.w),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Gap(168.h),
              Text(
                "Don’t have an Account?",
                style: font15weight400colorwhite,
              ),
              Gap(4.h),
              Text(
                "Sign up now!",
                style: font16weight500colorblue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
