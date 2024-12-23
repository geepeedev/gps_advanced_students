import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps_advanced_students/core/common/user/data/user_repo.dart';
import 'package:gps_advanced_students/core/common/user/user_cubit/user_cubit.dart';
import 'package:gps_advanced_students/core/network/cubit/internet_connection_cubit.dart';
import 'package:gps_advanced_students/core/network/network_repo.dart';
import 'package:gps_advanced_students/features/authentication/cubit/authentication_cubit.dart';
import 'package:gps_advanced_students/features/authentication/data/repository/auth_repository.dart';
import 'package:gps_advanced_students/features/authentication/data/source/auth_datasource.dart';
import 'package:gps_advanced_students/features/authentication/presentation/pages/login_view.dart';
import 'package:gps_advanced_students/features/dashboard/blocs/profile_cubits/student_info_cubit/student_info_cubit.dart';
import 'package:gps_advanced_students/features/dashboard/data/repository/dashboard_repository.dart';
import 'package:gps_advanced_students/features/dashboard/data/source/dashboard_datasource.dart';
import 'package:gps_advanced_students/features/dashboard/presentation/widget/dashboard.dart';

class GodspathApp extends StatelessWidget {
  const GodspathApp({super.key});
  // final internetConnection = Connectivity();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthDatasource(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepositoryImpl(
            authDatasource: context.read<AuthDatasource>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => InternetChecker(
            connectivity: Connectivity(),
          ),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(
            authDatasource: context.read<AuthDatasource>(),
          ),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InternetConnectionCubit(
                internet: context.read<InternetChecker>()),
          ),
          BlocProvider(
            create: (context) => AuthenticationCubit(
              internetChecker: context.read<InternetChecker>(),
              authRepository: context.read<AuthRepositoryImpl>(),
            ),
          ),
          BlocProvider(
              create: (context) => UserCubit(
                    context.read<UserRepository>(),
                  )
              // UserRepository(authDatasource: AuthDatasource())),
              ),
          BlocProvider(
            create: (context) => StudentInfoCubit(
              dashboardRepositoryImpl: DashboardRepositoryImpl(
                dashboardDatasource: DashboardDatasource(),
              ),
              internetChecker: context.read<InternetChecker>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocConsumer<UserCubit, UserState>(
            builder: (context, state) {
              return const LoginView();
            },
            listener: (context, state) {
              final user = state.user;
              if (user != null) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardLayout()),
                    (Route<dynamic> route) => false);
                context.read<StudentInfoCubit>().initStudentprofile(user);
              } else {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                    (Route<dynamic> route) => false);
              }
            },
          ),
        ),
      ),
    );
  }
}
