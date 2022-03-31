import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mealorium/Constants/cutsom_colors.dart';
import 'package:mealorium/Screens/HomeScreen.dart';
import 'package:mealorium/Widgets/add_profile_details.dart';
import 'package:mealorium/services/AccountCreationHandler.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

class PutOTPWidget extends StatelessWidget {
  PutOTPWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userEntered = Provider.of<AccountCreationHandler>(context);
    return FirebasePhoneAuthHandler(
      phoneNumber: userEntered.phoneNnumber.toString(),
      onLoginSuccess: (userCredential, autoVerified) async {
        Get.snackbar("Successfull", "Phone number verified successfully!");

        debugPrint(
          autoVerified
              ? "OTP was fetched automatically"
              : "OTP was verified manually",
        );

        debugPrint("Login Success UID: ${userCredential.user?.uid}");
      },
      onLoginFailed: (authException) {
        Get.snackbar(
            "Failed", 'Something went wrong (${authException.message})',
            colorText: Colors.white);

        debugPrint(authException.message);
        // handle error further if needed
      },
      builder: (context, controller) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Enter Code",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Enter the 4-digit verification code sent to",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.offText),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        userEntered.phoneNnumber.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      OTPTextField(
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 32,
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        style: TextStyle(
                            fontSize: 24.sp, color: CustomColors.offText),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        otpFieldStyle: OtpFieldStyle(
                            focusBorderColor: Theme.of(context).primaryColor),
                        onCompleted: (pin) async {
                          print("Completed: " + pin);
                          if (pin.length == 6) {
                            final isValidOTP = await controller.verifyOTP(
                              otp: pin,
                            );
                            // Incorrect OTP
                            if (!isValidOTP) {
                              print(
                                "Please enter the correct OTP sent to ",
                              );
                            } else {
                              Provider.of<AccountCreationHandler>(context,
                                      listen: false)
                                  .setCurrentPage(2);
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 17.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(children: const [
                            TextSpan(
                                text: "Resend SMS in ",
                                style: TextStyle(
                                  fontFamily: 'Apercu',
                                  color: Color(0xff7a7d86),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                            TextSpan(
                                text: "29s",
                                style: TextStyle(
                                  fontFamily: 'Apercu',
                                  color: Color(0xff000000),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                            TextSpan(
                                text: " ",
                                style: TextStyle(
                                  fontFamily: 'Apercu',
                                  color: Color(0xff448bcd),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                            TextSpan(
                                text: "or",
                                style: TextStyle(
                                  fontFamily: 'Apercu',
                                  color: Color(0xff7a7d86),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                            TextSpan(
                                text: " Verify via Call",
                                style: TextStyle(
                                  fontFamily: 'Apercu',
                                  color: Color(0xff448bcd),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                          ]))
                        ],
                      )
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}
