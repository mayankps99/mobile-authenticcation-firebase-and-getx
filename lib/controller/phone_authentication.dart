import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_github/views/home.dart';
import 'package:my_github/views/otp_screen.dart';

class PhoneController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;

  var status = "".obs;
  var mobile = "".obs;
  var loading = false.obs;
  var codeSent = 'no'.obs;
  var verificationID = '1'.obs;

  var gStatus = 0.obs;
  // ignore: non_constant_identifier_names
  int get google_status_result => gStatus.value;
  // ignore: non_constant_identifier_names
  String get status_result => status.value;
  // ignore: non_constant_identifier_names
  String get codeSent_result => codeSent.value;
  // ignore: non_constant_identifier_names
  String get verId_result => verificationID.value;
  bool get loadingResult => loading.value;

  signInWithPhone({
    required String phoneNumber,
  }) async {
    loading.value = true;
    await auth.verifyPhoneNumber(
      // Phone Number
      phoneNumber: '+91' +phoneNumber,
      //Triggers if Number verification completed
      verificationCompleted: (val) {
        loading.value = false;
      },
      //Triggers if verification fails
      verificationFailed: (FirebaseAuthException exception) {
        status.value = "Verification failed";
        loading.value = false;
      },
      //Triggers if firebase sends you the code
      codeSent: (val, id) {
        codeSent.value = "yes";
        verificationID.value = val;
        loading.value = false;
        Get.to(() => OTPScreen(
          mobileNumber: phoneNumber,
        ));
      },
      //After new Code generated
      codeAutoRetrievalTimeout: (val) {},
      //After t seconds resend code,
      timeout: Duration(seconds: 60),
    );
  }

  myCredentials(String verId, String input,String mobileNumber){
    AuthCredential authCredential = PhoneAuthProvider.credential(verificationId: verId, smsCode: input);
    // ignore: non_constant_identifier_names
    auth.signInWithCredential(authCredential).then((UserCredential) async {
      //If Success Move to Home Page
      loading.value = true;
      mobile.value = mobileNumber;
      Get.offAll(() => HomeScreen() );
    }).catchError((e){
      loading.value = false;
      print("Error --> $e");
    });
  }
}
