import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blott/src/config/theme/app_color.dart';
import 'package:blott/src/core/utils/app_const/app_icons.dart';
import 'package:blott/src/core/widgets/normal_text_style.dart';
import 'package:blott/src/features/auth/presentation/screens/get_notified.dart';

import 'package:blott/src/features/auth/presentation/viewmodels/login_user_viewmodel.dart';
import 'package:blott/src/features/auth/presentation/widgets/circle_widget.dart';
import 'package:blott/src/features/auth/presentation/widgets/textfield.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var loginProvider = context.read<LoginUserViewModel>();
    loginProvider.firstNameController.addListener(loginProvider.checkTextfield);
    loginProvider.lastNameController.addListener(loginProvider.checkTextfield);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<LoginUserViewModel>(
      builder: (context, vM, _) {
        return SafeArea(
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45.h,
                    ),
                    Text(
                      "Your legal name",
                      style: normalTextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                        "We need to know a bit about you so that we can create your account.",
                        style: normalTextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    SizedBox(
                      height: 25.h,
                    ),
                    customTextField("First name", vM.firstNameController),
                    SizedBox(
                      height: 25.h,
                    ),
                    customTextField("Last name", vM.lastNameController),
                    SizedBox(
                      height: 250.h,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: InkWell(
                          onTap: () {
                            if (vM.activateBtn) {
                              vM.loginUser();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GetNotified()));
                            }
                            null;
                          },
                          child: circleWithIcon(
                            cirlecleHeight: 60,
                            cirlecleWidth: 60,
                            iconWidth: 50,
                            iconHeight: 70,
                            appIcon: AppIcons.nextIcon2,
                            circleColor: vM.activateBtn
                                ? AppColors.lightPrimaryColor
                                : const Color.fromARGB(255, 200, 194, 238),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    ));
  }
}
