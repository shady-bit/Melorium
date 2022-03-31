import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteDishTile extends StatelessWidget {
  const FavouriteDishTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 67,
          height: 67,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text("Tea")
      ],
    );
  }
}
