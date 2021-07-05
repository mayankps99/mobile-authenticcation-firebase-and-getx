import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_github/controller/phone_authentication.dart';
import 'package:my_github/utils/colors.dart';
import 'package:my_github/utils/loader.dart';
import 'package:my_github/utils/size_config.dart';
import 'package:my_github/widgets/dialog.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  String mobileNumber;
  OTPScreen({required this.mobileNumber});

  @override
  _OTPScreenState createState() => _OTPScreenState(
      mobileNumber: mobileNumber
  );
}

class _OTPScreenState extends State<OTPScreen> {
  String mobileNumber;
  _OTPScreenState({required this.mobileNumber});
  final PhoneController pController = Get.put(PhoneController());
  TextEditingController _mobileController = TextEditingController();
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
              return controller.loading == true
                  ? Loader.dualRingLoader(AppColor.primaryColor)
                  : Container(
                height: SizeConfig.screenHeight -
                    MediaQuery.of(context).padding.top,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      'OTP',
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyText1!.copyWith(
                        color: AppColor.darkColor1,
                        fontSize: SizeConfig.textMultiplier * 3.5,
                        // height: Get.height * 0.036,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Text(
                      '(One Time Password)',
                      textAlign: TextAlign.center,
                      style: Get.textTheme.headline1!.copyWith(
                        color: AppColor.darkColor1,
                        fontSize: SizeConfig.textMultiplier * 2.5,
                        // height: Get.height * 0.036,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 1.5,
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6),
                      ],

                      controller: _mobileController,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        if (_mobileController.text.length <= 6) {}
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColor.appBlue),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColor.appBlue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.secondaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColor.appBlue),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.secondaryColor),
                        ),
                        hintText: 'Six Digit Code',
                        hintStyle:Get.textTheme.bodyText2!.copyWith(
                          color:
                          AppColor.blackColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.5,
                          // height: Get.height * 0.036,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2.5,
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              _mobileController.clear();
                              controller.signInWithPhone(phoneNumber: mobileNumber);
                            },
                            child: Container(
                              // width: SizeConfig.widthMultiplier * 30,
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                  SizeConfig.widthMultiplier * 8,
                                  vertical:
                                  SizeConfig.heightMultiplier *
                                      1),
                              decoration: BoxDecoration(
                                  color: AppColor.darkColor1,
                                  borderRadius:
                                  BorderRadius.circular(10)),
                              // ignore: deprecated_member_use
                              child: Center(
                                child: Text(
                                  'Resend',
                                  style: Get.textTheme.bodyText2!
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize:
                                    SizeConfig.textMultiplier *
                                        1.5,
                                    // height: Get.height * 0.036,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 5,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(() => CreateProfileScreen());

                        if(_mobileController.text.length == 6){
                          controller.myCredentials(
                              controller.verId_result,
                              _mobileController.text,
                              mobileNumber
                          );
                        }else{
                          DialogWidget.errorDialog(context, 'Enter a valid OTP', (){

                          });
                        }
                      },
                      child: Container(
                        width: SizeConfig.widthMultiplier * 35,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            SizeConfig.widthMultiplier * 8,
                            vertical:
                            SizeConfig.heightMultiplier * 1.25),
                        decoration: BoxDecoration(
                            color: AppColor.appBlue,
                            borderRadius: BorderRadius.circular(5)),
                        // ignore: deprecated_member_use
                        child: Center(
                          child: Text(
                            'Continue',
                            style: Get.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontSize:
                              SizeConfig.textMultiplier * 1.5,
                              // height: Get.height * 0.036,
                            ),
                          ),
                        ),
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
