import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gps_advanced_students/core/Error/auth_failure.dart';
import 'package:gps_advanced_students/core/Success/auth_success.dart';
import 'package:gps_advanced_students/core/common/components/form_input_field.dart';
import 'package:gps_advanced_students/core/common/components/main_button.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/common/components/text_button.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
// import 'package:gps_advanced_students/core/network/cubit/internet_connection_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_advanced_students/features/authentication/cubit/authentication_cubit.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/widget/dashboard.dart';

import 'package:iconsax_plus/iconsax_plus.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  bool isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, SigninState>(
      // listenWhen: (previous, current) => current.status == SigninStatus.failure,
      listener: (context, state) {
        if (state.status == SigninStatus.success && state.success != null) {
          final success = state.success;
          if (success is LoginSuccess) {
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
                MaterialPageRoute(
                    builder: (context) => const DashboardLayout()),
                (route) => false);
          }
        }
        if (state.status == SigninStatus.failure && state.failure != null) {
          final failure = state.failure;

          if (failure is InvalidEmailOrPaswordFormatAuthFailure) {
            DelightToastBar(
                animationDuration: const Duration(milliseconds: 400),
                // snackbarDuration: Duration(milliseconds: 700),
                position: DelightSnackbarPosition.top,
                autoDismiss: true,
                builder: (BuildContext context) {
                  return ToastCard(
                    color: GpColors.error,
                    title: GpText.headline(
                      text: failure.title,
                      textColor: GpColors.onsecondary,
                    ),
                    subtitle: GpText.body(
                      text: failure.error,
                      textColor: GpColors.textlight,
                    ),
                  );
                }).show(context);
          } else if (failure is NullEmailOrPasswordAuthFailure) {
            DelightToastBar(
                animationDuration: const Duration(milliseconds: 400),
                // snackbarDuration: Duration(milliseconds: 700),
                position: DelightSnackbarPosition.top,
                autoDismiss: true,
                builder: (BuildContext context) {
                  return ToastCard(
                    color: GpColors.error,
                    title: GpText.headline(
                      text: failure.title,
                      textColor: GpColors.onsecondary,
                    ),
                    subtitle: GpText.body(
                      text: failure.error,
                      textColor: GpColors.textlight,
                    ),
                  );
                }).show(context);
          } else if (failure is ExecutionErrorAuthFailure) {
            return DelightToastBar(
                animationDuration: const Duration(milliseconds: 400),
                position: DelightSnackbarPosition.top,
                autoDismiss: true,
                builder: (BuildContext context) {
                  return ToastCard(
                    color: GpColors.error,
                    title: GpText.headline(
                      text: failure.error.toString(),
                      textColor: GpColors.onsecondary,
                    ),
                    subtitle: GpText.body(
                      text: 'Error encountered making login request',
                      textColor: GpColors.textlight,
                    ),
                  );
                }).show(context);
          } else if (failure is AuthErrorAuthFailure) {
            return DelightToastBar(
                animationDuration: const Duration(milliseconds: 400),
                position: DelightSnackbarPosition.top,
                autoDismiss: true,
                builder: (BuildContext context) {
                  return ToastCard(
                    color: GpColors.error,
                    title: GpText.headline(
                      text: failure.statusCode.toString(),
                      textColor: GpColors.onsecondary,
                    ),
                    subtitle: GpText.body(
                      text: failure.message!,
                      textColor: GpColors.textlight,
                    ),
                  );
                }).show(context);
          }
        }
      },
      builder: (context, state) {
        return Flexible(
          fit: FlexFit.loose,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GpFormInputField(
                  keyboardType: TextInputType.emailAddress,
                  errorWidget: state.email?.email.match(
                      (failure) => GpText.body(
                            fontsize: 12,
                            text: failure.message,
                            textColor: GpColors.error,
                          ),
                      (text) => null),
                  textfieldLabel: 'Email address',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(IconsaxPlusLinear.sms_edit),
                  onChanged: (value) {
                    context.read<AuthenticationCubit>().onEmail(value);
                  },
                ),
                const Gap(25),
                // password field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GpFormInputField(
                      keyboardType: TextInputType.visiblePassword,
                      errorWidget: state.password?.password.match(
                          (failure) => GpText.body(
                                fontsize: 12,
                                text: failure.message,
                                textColor: GpColors.error,
                              ),
                          (text) => null),
                      textfieldLabel: 'Password',
                      isObsecureText: isObsecure,
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(IconsaxPlusLinear.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        icon: isObsecure
                            ? const Icon(IconsaxPlusLinear.eye)
                            : const Icon(IconsaxPlusLinear.eye_slash),
                      ),
                      onChanged: (value) {
                        context.read<AuthenticationCubit>().onPassword(value);
                      },
                    ),
                    const Gap(8),
                    const GpTextButton(buttonText: "Forgot password?")
                  ],
                ),
                const Gap(50),
                GpElevatedButton(
                  onTap: () {
                    context.read<AuthenticationCubit>().onSignin();
                  },
                  disabled: state.status == SigninStatus.loading ? true : false,
                  buttonText: 'Login',
                  width: 400,
                  height: 45,
                ),
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GpText.body(
                      text: "Don't have an account ?",
                      fontsize: 16,
                      fontWeight: FontWeight.w400,
                      textColor: GpColors.textDark,
                    ),
                    const Gap(6),
                    const GpTextButton(buttonText: 'Signup'),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
