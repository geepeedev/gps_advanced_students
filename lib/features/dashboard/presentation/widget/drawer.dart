import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gps_advanced_students/core/Error/auth_failure.dart';
import 'package:gps_advanced_students/core/Success/auth_success.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/common/components/text_button.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:gps_advanced_students/core/common/user/user_cubit/user_cubit.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
// import 'package:gps_advanced_students/features/authentication/cubit/authentication_cubit.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gps_advanced_students/core/constants/enums/draweritem_enum.dart';
import 'package:gps_advanced_students/features/authentication/cubit/authentication_cubit.dart';
import 'package:gps_advanced_students/features/authentication/presentation/pages/login_view.dart';
import 'package:gps_advanced_students/features/dashboard/blocs/dashboard_cubit/dashboard_cubit.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, SigninState>(
      listener: (BuildContext context, state) {
        if (state.status == SigninStatus.success && state.success != null) {
          final success = state.success;
          if (success is SignoutSuccess) {
            DelightToastBar(
                animationDuration: const Duration(milliseconds: 400),
                // snackbarDuration: Duration(milliseconds: 700),
                position: DelightSnackbarPosition.top,
                autoDismiss: true,
                builder: (BuildContext context) {
                  return ToastCard(
                    color: GpColors.success,
                    title: GpText.headline(
                      text: success.title!,
                      textColor: GpColors.textlight,
                    ),
                    subtitle: GpText.body(
                      text: success.message!,
                      textColor: GpColors.textlight,
                    ),
                  );
                }).show(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
                (route) => false);
          }
        }
        if (state.status == SigninStatus.failure && state.failure != null) {
          final success = state.failure;
          if (success is SignoutAuthFailure) {
            DelightToastBar(
                animationDuration: const Duration(milliseconds: 400),
                // snackbarDuration: Duration(milliseconds: 700),
                position: DelightSnackbarPosition.top,
                autoDismiss: true,
                builder: (BuildContext context) {
                  return ToastCard(
                    color: GpColors.success,
                    title: GpText.headline(
                      text: success.title,
                      textColor: GpColors.textlight,
                    ),
                    subtitle: GpText.body(
                      text: success.message!,
                      textColor: GpColors.textlight,
                    ),
                  );
                }).show(context);
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: GpColors.onPrimary.withOpacity(0.09),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 28),
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: GpText.body(
                  text: ' this is the logo spot',
                  textColor: GpColors.textlight,
                ),
              ),
            ),
            BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const Gap(12),
                    ...List.generate(
                      DraweritemEnum.values.length,
                      (index) => GestureDetector(
                        onTap: () {
                          final item = DraweritemEnum.values.elementAt(index);
                          context
                              .read<DashboardCubit>()
                              .onPageselected(index, item);
                        },
                        child: DrawerItemWidget(
                          isActive: state.item.index == index ? true : false,
                          icon: DraweritemEnum.values[index].itemIcon,
                          itemText: DraweritemEnum.values[index].itemName,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const Gap(200),
            GpTextButton(
              buttonText: 'Signout',
              onPressed: () {
                context.read<AuthenticationCubit>().onSignout();
              },
            )
          ],
        ),
      )
          .animate()
          .slideX(begin: 0.1, end: 0, duration: Durations.extralong4)
          .fadeIn(delay: Durations.medium3, duration: Durations.extralong3),
    );
  }
}

class DrawerItemWidget extends StatefulWidget {
  const DrawerItemWidget({
    super.key,
    required this.icon,
    required this.itemText,
    this.isActive = false,
  });
  final IconData icon;
  final String itemText;
  final bool isActive;
  @override
  State<DrawerItemWidget> createState() => _DrawerItemWidgetState();
}

class _DrawerItemWidgetState extends State<DrawerItemWidget> {
  num scaleSize = 1;
  Color iconColor = GpColors.accent;
  Color itemColor = GpColors.accent;
  Color itemBackgroundColor = GpColors.onPrimary.withOpacity(0.1);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          itemBackgroundColor = GpColors.onPrimary;
          iconColor = GpColors.background;
          itemColor = GpColors.background;
          scaleSize = 1.04;
        });
      },
      onExit: (event) {
        setState(() {
          itemBackgroundColor = GpColors.onPrimary.withOpacity(0.1);
          iconColor = GpColors.accent;
          itemColor = GpColors.textlight;
          scaleSize = 1;
        });
      },
      child: AnimatedContainer(
        width: 210,
        // height: 50,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: widget.isActive ? GpColors.primary : itemBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(milliseconds: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: widget.isActive ? GpColors.background : iconColor,
            ),
            const Gap(14),
            GpText.body(
              text: widget.itemText,
              textColor: widget.isActive ? GpColors.background : itemColor,
            ),
          ],
        ),
      ).animate().scaleXY(
            // begin: scaleSize.toDouble(),
            // delay: Duration(seconds: 2),
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 100),
            end: scaleSize.toDouble(),
          ),
    );
  }
}
