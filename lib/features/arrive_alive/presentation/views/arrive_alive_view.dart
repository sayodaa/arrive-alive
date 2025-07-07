import 'package:arrive_alive/core/themes/app_assets.dart';
import 'package:arrive_alive/core/themes/app_colors.dart';
import 'package:arrive_alive/core/themes/app_styles.dart';
import 'package:arrive_alive/features/home/presentation/widgets/custom_alive_view.dart';
import 'package:flutter/material.dart';

class ArriveAliveView extends StatelessWidget {
  const ArriveAliveView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Text('Detection',style: AppStyles.font14W100.copyWith(fontSize: 24,color: AppColors.myGray),),
              Image.asset(AppAssets.arriveAliveView),
              const CustomAliveView(text: 'Warning : Eyes Closing Frequently',color: Colors.yellow,),
            ],
          ),
      ),
    )
    );
  }
}
