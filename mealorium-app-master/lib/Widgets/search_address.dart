import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mealorium/Constants/cutsom_colors.dart';

class SearchAddressWidget extends StatelessWidget {
  const SearchAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: 10.w),
      width: dimension.width * 0.7,
      height: dimension.height * 0.053,
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: CustomColors.outlineGrey)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              height: dimension.height * 0.053,
              width: dimension.height * 0.053,
              decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.outlineGrey),
                  borderRadius: BorderRadius.circular(36)),
              child: Icon(
                LineIcons.mapMarker,
                color: CustomColors.emphasisBlue,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              "Chitkara University, Ra...",
              style: TextStyle(
                  fontSize: 12.sp,
                  letterSpacing: 0.7,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade700),
            ),
          ],
        ),
        Icon(
          LineIcons.angleDown,
          color: CustomColors.emphasisBlue,
          size: 20,
        ),
      ]),
    );
  }
}
