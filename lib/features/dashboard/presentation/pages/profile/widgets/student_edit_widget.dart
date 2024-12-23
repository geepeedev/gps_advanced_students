import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:gps_advanced_students/core/common/components/form_input_field.dart';
import 'package:gps_advanced_students/core/common/components/main_button.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:gps_advanced_students/core/helpers/helper_functions.dart';
import 'package:gps_advanced_students/features/dashboard/blocs/profile_cubits/edit_student_info/student_edit_cubit.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class StudentEditWidget extends StatefulWidget {
  const StudentEditWidget({super.key});

  @override
  State<StudentEditWidget> createState() => _StudentEditWidgetState();
}

class _StudentEditWidgetState extends State<StudentEditWidget> {
  final List<String> gender = ['Female', 'Male'];
  final TextEditingController dobController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController stateOfOriginController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? selectedGender;

  @override
  void dispose() {
    dobController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    stateOfOriginController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentEditCubit, EditStudentInfoState>(
      listener: (context, state) {
        firstNameController.text = state.studentProfile.firstName ?? '';
        dobController.text = state.studentProfile.dateOfBirth ?? '';
        lastNameController.text = state.studentProfile.lastName ?? "";
        ageController.text = state.studentProfile.age.toString();
        stateOfOriginController.text = state.studentProfile.stateOfOrigin ?? "";
        addressController.text = state.studentProfile.address ?? "";
        selectedGender = state.studentProfile.gender;

        if (state.changeState == EditStatus.success) {
          DelightToastBar(
              animationDuration: const Duration(milliseconds: 100),
              snackbarDuration: const Duration(milliseconds: 300),
              position: DelightSnackbarPosition.top,
              autoDismiss: true,
              builder: (BuildContext context) {
                return ToastCard(
                  color: GpColors.primary,
                  title: GpText.headline(
                    text: 'Changes Saved',
                    textColor: GpColors.background,
                  ),
                );
              }).show(context);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GpFormInputField(
                textfieldLabel: 'FirstName',
                keyboardType: TextInputType.name,
                controller: firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid First name';
                  }
                  return null;
                },
              ),
              const Gap(6),
              GpFormInputField(
                textfieldLabel: 'LastName',
                controller: lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid Last name';
                  }
                  return null;
                },
              ),
              const Gap(12),
              GpText.body(
                text: 'Gender',
                textColor: GpColors.accent,
                textAlign: TextAlign.start,
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 195,
                    child: Material(
                      color: Colors.black,
                      child: RadioListTile.adaptive(
                        activeColor: GpColors.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        tileColor: GpColors.secondary,
                        hoverColor: GpColors.onsecondary,
                        splashRadius: 16,
                        title: GpText.body(
                          text: 'Female',
                          textColor: GpColors.background,
                        ),
                        dense: true,
                        value: gender[0],
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const Gap(10),
                  SizedBox(
                    width: 195,
                    child: Material(
                      color: Colors.black,
                      child: RadioListTile(
                        splashRadius: 16,
                        activeColor: GpColors.background,
                        hoverColor: GpColors.onsecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        tileColor: GpColors.secondary,
                        dense: true,
                        title: GpText.body(
                          text: 'Male',
                          textColor: GpColors.background,
                        ),
                        value: gender[1],
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              const Gap(6),
              GpFormInputField(
                textfieldLabel: 'Age',
                keyboardType: TextInputType.number,
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: ageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid Age';
                  }
                  return null;
                },
              ),
              const Gap(6),
              GpFormInputField(
                textfieldLabel: 'Date of Birth',
                controller: dobController,
                readOnly: true,
                suffixIcon: IconButton(
                  onPressed: () async {
                    final selectedDate = await KHelpers.selectDate(context);
                    if (selectedDate != null) {
                      setState(() {
                        dobController.text =
                            selectedDate.toString().split(' ')[0];
                      });
                    }
                  },
                  icon: const Icon(
                    IconsaxPlusLinear.calendar_1,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid Date of birth';
                  }
                  return null;
                },
              ),
              const Gap(6),
              GpFormInputField(
                textfieldLabel: 'State Of origin',
                controller: stateOfOriginController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid State of origin';
                  }
                  return null;
                },
              ),
              const Gap(6),
              GpFormInputField(
                maxLines: 3,
                textfieldLabel: 'Address',
                controller: addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid Address';
                  }
                  return null;
                },
              ),
              const Gap(25),
              GpElevatedButton(
                // disabled: true,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<StudentEditCubit>().onStudentInfoUpdated(
                        firstNameController.text,
                        lastNameController.text,
                        ageController.text,
                        dobController.text,
                        stateOfOriginController.text,
                        addressController.text,
                        selectedGender ?? 'Female');
                  }
                },
                buttonText: 'Save Changes',
                width: 200,
                height: 45,
              )
            ],
          ),
        );
      },
    );
  }
}
