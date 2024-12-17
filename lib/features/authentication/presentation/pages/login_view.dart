import 'package:flutter/material.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:gps_advanced_students/core/constants/nav_windows.dart';
import 'package:gps_advanced_students/core/helpers/helper_functions.dart';
import 'package:gps_advanced_students/features/authentication/presentation/widgets/login_form_widget.dart';
import 'package:gps_advanced_students/features/authentication/presentation/widgets/header_widget.dart';
import 'package:gps_advanced_students/features/authentication/presentation/pages/onboarding_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GpColors.background,
      body: Column(
        children: [
          const LimitedBox(
            child: WindowsButtons(),
          ),
          Expanded(
            child: Row(
              children: [
                // this is the sign in form section
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //form header
                        LoginHeaderWidget(),

                        // form section
                        LoginFormWidget(),
                      ],
                    ),
                  ),
                ),
                //this is the onboarding section
                if (KHelpers.isDesktopLg(context)) const OnboardingView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
