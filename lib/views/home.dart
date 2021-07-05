import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_github/controller/phone_authentication.dart';
import 'package:my_github/utils/colors.dart';
import 'package:my_github/utils/size_config.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState(

  );
}

class _HomeScreenState extends State<HomeScreen> {

  final PhoneController pController = Get.put(PhoneController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarDividerColor: Colors.transparent),
        child: SafeArea(
          child: SingleChildScrollView(
            child: GetX<PhoneController>(builder: (controller) {
              // ignore: unrelated_type_equality_checks
              return Container(
                height: SizeConfig.screenHeight -
                    MediaQuery.of(context).padding.top,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${controller.mobile.value}',
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyText1!.copyWith(
                        color: AppColor.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 4.5,
                        // height: Get.height * 0.036,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 8,
                    ),
                    Text(
                      'Successfully Logged In',
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyText1!.copyWith(
                        color: AppColor.darkColor1,
                        fontSize: SizeConfig.textMultiplier * 3.5,
                        // height: Get.height * 0.036,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
