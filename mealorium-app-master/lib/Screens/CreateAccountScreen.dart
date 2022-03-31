import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mealorium/Constants/custom_textstyles.dart';
import 'package:mealorium/Constants/cutsom_colors.dart';
import 'package:mealorium/Widgets/add_profile_details.dart';
import 'package:mealorium/Widgets/enter_phone_no.dart';
import 'package:mealorium/Widgets/put_otp.dart';
import 'package:mealorium/services/AccountCreationHandler.dart';
import 'package:mealorium/validations/ProfileDetailValidation.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'IN';

  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  Widget buildInternalWidget(int pageIndex) {
    switch (pageIndex) {
      case 0:
        {
          return EnterPhoneNumber();
        }
        break;
      case 1:
        {
          return PutOTPWidget();
        }
        break;
      case 2:
        {
          return AddProfileDetails();
        }
        break;
      default:
        {
          return Center(
            child: Text(":("),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileDetailsValidation()),
      ],
      child: FirebasePhoneAuthProvider(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: buildInternalWidget(
                  Provider.of<AccountCreationHandler>(context).getPage()),
            )
          ]),
        ),
      ),
    );
  }
}
