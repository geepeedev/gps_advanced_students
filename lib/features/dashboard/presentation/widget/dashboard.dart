import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_advanced_students/core/constants/colors.dart';
import 'package:gps_advanced_students/core/constants/nav_windows.dart';
import 'package:gps_advanced_students/features/dashboard/blocs/dashboard_cubit/dashboard_cubit.dart';
import 'package:gps_advanced_students/features/dashboard/data/repository/dashboard_repository.dart';
import 'package:gps_advanced_students/features/dashboard/data/source/dashboard_datasource.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/classroom/classroom_view.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/profile/profile_view.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/quiz/quiz_vew.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/pages/result/result_view.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/widget/drawer.dart';
// import 'package:flutter_animate/flutter_animate.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  final List<Widget> dashboardPages = const [
    ClassroomView(),
    QuizVew(),
    ResultView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: Scaffold(
        backgroundColor: GpColors.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const DrawerWidget(),
              Expanded(
                flex: 6,
                child: BlocBuilder<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        const LimitedBox(
                          child: WindowsButtons(),
                        ),
                        RepositoryProvider(
                          create: (context) => DashboardRepositoryImpl(
                              dashboardDatasource: DashboardDatasource()),
                          child: Flexible(
                            child: DynMouseScroll(
                                builder: (context, controller, physics) {
                              return SingleChildScrollView(
                                physics: physics,
                                controller: controller,
                                child: Center(
                                  child: dashboardPages.elementAt(state.index),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
