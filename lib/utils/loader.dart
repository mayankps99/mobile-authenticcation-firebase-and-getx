import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_github/utils/colors.dart';
import 'package:my_github/utils/size_config.dart';

class Loader{
  static Widget dualRingLoader(Color color){
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: AppColor.blackColor.withOpacity(0.75),
      child: Center(
        child:
        Container(
          height: SizeConfig.heightMultiplier * 10,
          width: SizeConfig.heightMultiplier * 10,
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: SpinKitDualRing (
              color: color,
              size: SizeConfig.heightMultiplier * 5,
            ),
          ),
        ),
      ),
    );
  }

  static Widget pouringHourglass(Color color){
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: AppColor.blackColor.withOpacity(0.75),
      child: Center(
        child:
        Container(
          height: SizeConfig.heightMultiplier * 10,
          width: SizeConfig.heightMultiplier * 10,
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: SpinKitPouringHourglass (
              color: color,
              size: SizeConfig.heightMultiplier * 5,
            ),
          ),
        ),
      ),
    );
  }
}