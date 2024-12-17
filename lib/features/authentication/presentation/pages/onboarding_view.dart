import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gps_advanced_students/core/constants/enums/onboarding_enum.dart';
import 'package:gps_advanced_students/features/authentication/presentation/widgets/onboarding_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({
    super.key,
  });

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final Stream<int> _onboardingPageStream =
      Stream.periodic(const Duration(seconds: 3), (int count) {
    return Random().nextInt(3);
  });
  late PageController? onboardingController;
  late StreamSubscription<int>? _onpageSub;
  StreamController? onboardingStream;

  @override
  void initState() {
    super.initState();
    StreamController<int> onboardingStream = StreamController();
    if (mounted) {
      onboardingController = PageController();
      onboardingStream.addStream(_onboardingPageStream);
      _onpageSub = onboardingStream.stream.listen(
        (int event) {
          setState(
            () {
              onboardingController?.animateToPage(event,
                  curve: Curves.easeIn, duration: const Duration(seconds: 2));
            },
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _onpageSub?.cancel();
    onboardingStream?.close();
    onboardingController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: OnboardingEnum.values.length,
        controller: onboardingController,
        itemBuilder: (context, index) {
          return OnboardingWidget(
              onboardingTitle: OnboardingEnum.values[index].title,
              onboardingImage: OnboardingEnum.values[index].image,
              onboaringColor: OnboardingEnum.values[index].color);
        },
      ),
    );
  }
}
