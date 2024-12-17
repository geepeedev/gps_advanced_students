import 'package:flutter/widgets.dart';
import 'package:gps_advanced_students/core/common/components/text.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';

class ClassroomView extends StatelessWidget {
  const ClassroomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GpText.headline(
        text: 'This is the classroom page',
        fontsize: 40,
        textColor: GpColors.textlight,
      ),
    );
  }
}
