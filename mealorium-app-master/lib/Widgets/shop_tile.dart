import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mealorium/Constants/cutsom_colors.dart';

class ShopTileWidget extends StatelessWidget {
  const ShopTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 135.5.h,
      // width: 123.5.w,
      decoration: BoxDecoration(
          color: Color(0xffffffff), borderRadius: BorderRadius.circular(9)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            width: 125.5.w,
            height: 76.75.h,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9)))),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Text("Food Court shop 01",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff282828),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 11,
                    color: CustomColors.starIcon,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(" 4.3 (326 ratings)",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xffb6b6c0),
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      )),
                ],
              ),
              SizedBox(
                height: 6.7.h,
              ),
              Text("05-10 min",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xffecb2ad),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
