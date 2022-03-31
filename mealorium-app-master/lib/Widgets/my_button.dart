import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPress;
  const MyButton({
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0))),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: const Text(
                  "CONFIRM",
                  style: TextStyle(
                    fontFamily: 'Apercu',
                    color: Color(0xffffffff),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.4,
                  ),
                )),
          ),
        )
      ],
    );
  }
}
