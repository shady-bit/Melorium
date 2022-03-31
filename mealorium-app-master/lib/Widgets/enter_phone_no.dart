import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mealorium/Constants/cutsom_colors.dart';
import 'package:mealorium/Screens/CreateAccountScreen.dart';
import 'package:mealorium/Widgets/my_button.dart';
import 'package:mealorium/services/AccountCreationHandler.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EnterPhoneNumber extends StatelessWidget {
  EnterPhoneNumber({
    Key? key,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void getPhoneNumber(BuildContext context, String phoneNumber) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      PhoneNumber number =
          await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'IN');
      Provider.of<AccountCreationHandler>(context, listen: false)
          .setPhoneNumber(number);
      Provider.of<AccountCreationHandler>(context, listen: false)
          .setCurrentPage(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: 21.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InternationalPhoneNumberInput(
                      hintText: "Enter your mobile number",
                      onInputChanged: (PhoneNumber number) {},
                      onInputValidated: (bool value) {
                        print("Validation: $value");
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      scrollPadding: EdgeInsets.zero,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      formatInput: false,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                    SizedBox(height: 20.h),
                    MyButton(
                      onPress: () {
                        getPhoneNumber(context, controller.text);
                      },
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 1.h, color: CustomColors.lineColor),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text("OR",
                                style: TextStyle(
                                  fontFamily: 'Apercu',
                                  color: Color(0xff999ba2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.4,
                                ))),
                        Expanded(
                          child: Container(
                              height: 1.h, color: CustomColors.lineColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: CustomColors.lineColor,
                                  spreadRadius: 1),
                            ],
                          ),
                          child: IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.google),
                              onPressed: () {
                                print("Pressed");
                              }),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: CustomColors.lineColor,
                                  spreadRadius: 1),
                            ],
                          ),
                          child: IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: FaIcon(FontAwesomeIcons.apple),
                              onPressed: () {
                                print("Pressed");
                              }),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: CustomColors.lineColor,
                                  spreadRadius: 1),
                            ],
                          ),
                          child: IconButton(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon: Icon(Icons.more_horiz),
                              onPressed: () {
                                print("Pressed");
                              }),
                        )
                      ],
                    ),
                  ],
                ),
                Column(children: const [
                  Text("By continuing, I agree to the ",
                      style: TextStyle(
                        fontFamily: 'Apercu',
                        color: Color(0xff7a7d86),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                  Text("Terms of Use    Privacy Policy     Content Policy",
                      style: TextStyle(
                        fontFamily: 'Apercu',
                        color: Color(0xff282828),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ))
                ])
              ],
            )),
      ),
    );
  }
}
