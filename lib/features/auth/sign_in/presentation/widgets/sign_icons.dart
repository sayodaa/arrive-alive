import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:flutter/material.dart';

class SignIcons extends StatelessWidget {
  const SignIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignIconWidget(
          logo: AppAssets.googleLogo,
          onTap: () {},
        ),
        const SizedBox(width: 45),
        SignIconWidget(
          logo: AppAssets.faceLogo,
          onTap: () async {},
        ),
        const SizedBox(width: 45),
        SignIconWidget(
          logo: AppAssets.xLogo,
          onTap: () async {
            // يمكنك إضافة مزود تسجيل دخول آخر هنا
          },
        ),
      ],
    );
  }
}

class SignIconWidget extends StatelessWidget {
  const SignIconWidget({super.key, required this.logo, required this.onTap});
  final String logo;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(width: 50, height: 50, child: Image.asset(logo)),
    );
  }
}
