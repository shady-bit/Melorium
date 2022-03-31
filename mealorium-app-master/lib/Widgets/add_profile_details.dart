import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealorium/Constants/custom_textstyles.dart';
import 'package:mealorium/Constants/cutsom_colors.dart';
import 'package:mealorium/Widgets/my_button.dart';
import 'package:mealorium/validations/ProfileDetailValidation.dart';
import 'package:provider/provider.dart';

class AddProfileDetails extends StatelessWidget {
  const AddProfileDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ProfileDetailsValidation>(context);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
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
                  Text("Add  profile details",
                      style: MyTextStyles.mediumHeading),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "FULL NAME",
                        errorText: validationService.fullName.error,
                        labelStyle: TextStyle(
                            fontSize: 12.sp, color: CustomColors.offText)),
                    onChanged: (val) {
                      validationService.changeName(val);
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "EMAIL",
                        errorText: validationService.email.error,
                        labelStyle: TextStyle(
                            fontSize: 12.sp, color: CustomColors.offText)),
                    onChanged: (val) {
                      validationService.changeEmail(val);
                    },
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  MyButton(
                    onPress: validationService.isvalid ? () {} : null,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
