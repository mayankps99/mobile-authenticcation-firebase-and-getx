import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_github/utils/colors.dart';
import 'package:my_github/utils/size_config.dart';

class DialogWidget {
  static successDialog(context, title, onPressed) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: false,
        title: 'Success',
        desc: title,
        btnOkOnPress: onPressed,
        btnOkIcon: Icons.check,
        btnOkColor: Colors.green)
      ..show();
  }

  static errorDialog(context, title, onPressed) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: false,
        title: 'Warning',
        desc: title,
        btnOkOnPress: onPressed,
        btnOkIcon: Icons.check,
        btnOkColor: AppColor.secondaryColor )
      ..show();
  }

  static errorAlert(context, title ,Color color , onPressed){
    return showDialog(
        context: context,
        builder: (context){
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.whiteColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.heightMultiplier),
                    child: Text(
                      title,
                      style: Get.textTheme.bodyText1!.copyWith(
                        color: AppColor.darkColor1,
                        fontSize: SizeConfig.textMultiplier * 2,
                        // height: Get.height * 0.036,
                      )
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  InkWell(
                    onTap: onPressed,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 5,
                        vertical: SizeConfig.widthMultiplier * 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.secondaryColor ,
                      ),
                      child: Center(
                        child: Text(
                            'OK',
                            style: Get.textTheme.headline1!.copyWith(
                              color: AppColor.whiteColor,
                              fontSize: SizeConfig.textMultiplier * 2,
                              // height: Get.height * 0.036,
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  static alertDialog(context, title, onPressed) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.QUESTION,
        buttonsTextStyle: Get.textTheme.headline1!.copyWith(
          color: AppColor.whiteColor,
          fontSize: SizeConfig.textMultiplier * 2,
          // height: Get.height * 0.036,
        ),
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: false,
        title: 'Are you sure',
        desc: title,
        btnOkOnPress: onPressed,
        btnOkColor: AppColor.appBlue,
        btnCancelText: 'Cancel',
        btnCancelOnPress: (){}, 
        )
      ..show();
  }
}
