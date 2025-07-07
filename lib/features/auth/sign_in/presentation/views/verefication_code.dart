import 'package:arrive_alive/core/helper/extentions.dart';
import 'package:arrive_alive/core/routes/routes.dart';
import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/core/themes/app_styles.dart';
import 'package:arrive_alive/features/onboarding/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class VereficationCodeView extends StatelessWidget {
  const VereficationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 10.0,
            ),
            child: Column(
              children: [
                const Center(
                  child: Text('Forget Password', style: AppStyles.font31W700),
                ),
                Center(child: Image.asset(AppAssets.forgetPass1, height: 300)),
                const SizedBox(height: 20),
                Text(
                  'Enter Verification code',
                  style: AppStyles.font14W100.copyWith(fontSize: 22),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomPaint(
                      size: const Size(55, 55), // حجم الدائرة
                      painter: CirclePainter(),
                    ),
                    CustomPaint(
                      size: const Size(55, 55), // حجم الدائرة
                      painter: CirclePainter(),
                    ),
                    CustomPaint(
                      size: const Size(55, 55), // حجم الدائرة
                      painter: CirclePainter(),
                    ),
                    CustomPaint(
                      size: const Size(55, 55), // حجم الدائرة
                      painter: CirclePainter(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(text: 'Verify', onPressed: () {
                  context.pushNamed(Routes.changePasswordScreen);
                }),
                const SizedBox(height: 10),
                const Text('Send Again', style: AppStyles.font14W100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color =
              Colors
                  .white
          ..style = PaintingStyle.fill;

    final borderPaint =
        Paint()
          ..color =
              Colors
                  .black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
