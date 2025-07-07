import 'package:arrive_alive/core/helper/extentions.dart';
import 'package:arrive_alive/core/routes/routes.dart' show Routes;
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int index = 0;

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged:
                  (value) => setState(() {
                    index = value;
                  }),
              children: [
                const OnboardingWidget(
                  heightText: 50,
                  image: AppAssets.welcome,
                  desc:
                      'Arrive Alive is application designed to enhance road safety by monitoring the driver\'s alertness in real-time. Using cutting-edge computer vision technology, the system analyzes the driver\'s facial features, such as eye movements and head position, to detect signs of drowsiness or fatigue. When the system identifies a potential risk, it immediately alerts the driver through visual and audio notifications, prompting them to take a break or rest',
                  title1: 'Welcomne in',
                  title2: 'Arrive Alive',
                ),
                const OnboardingWidget(
                  imageHeight: 280,
                  titleSpacing: 0,
                  image: AppAssets.onboardThink,
                  desc:
                      'This application is ideal for long-distance drivers, fleet managers, and anyone concerned about road safety. It is easy to use, highly accurate, and customizable to suit individual preferences. With its user-friendly interface and real-time monitoring capabilities, the Driver Drowsiness Detection System is a must-have tool for preventing accidents caused by driver fatigue.',
                ),
                const OnboardingWidget(
                  image: AppAssets.onboardThree,
                  desc:
                      '''Key Features:
1. Real-Time Monitoring : Continuously tracks the driver's alertness level.
2. Advanced Drowsiness Detection : Uses advanced algorithms to analyze eye and head movements.
3. Customizable Alerts : Visual and audio notifications to warn the driver.
4. Statistics Dashboard : Provides insights into driving patterns and alertness levels.
5. User-Friendly Interface : Simple and intuitive design for easy navigation.''',
                ),
                Image.asset(AppAssets.onboardingCar, width: 280, height: 200),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: index == 0 || index == 3
                ? CustomButton(
                    text: index == 3 ? 'Get Starting' :  'Next',
                    onPressed: () {
                      if (index == 3) {
                       context.pushNamed(Routes.loginScreen);
                      }
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        width: 180,
                        text: 'Back',
                        onPressed: () {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      const SizedBox(width: 20),
                      CustomButton(
                        width: 180,
                        text:'Next',
                        onPressed: () {
                          if (index <= 2) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
