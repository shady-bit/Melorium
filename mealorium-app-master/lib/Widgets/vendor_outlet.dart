import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealorium/Constants/custom_textstyles.dart';
import 'package:mealorium/Constants/cutsom_colors.dart';

class VendorOutletWidget extends StatelessWidget {
  const VendorOutletWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64.h,
        decoration: BoxDecoration(),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Container(
                width: 72,
                height: 64,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(9))),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Boys Hostel Tuck Shop", style: MyTextStyles.subheading),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      size: 11,
                      color: CustomColors.starIcon,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text("4.3 (326 ratings)",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xffb6b6c0),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ))
                  ],
                )
              ],
            ),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("0.2 KM",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff7a7d86),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(
                height: 5.h,
              ),
              Text("05-10 min",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xffecb2ad),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          )
        ]));
  }
}
