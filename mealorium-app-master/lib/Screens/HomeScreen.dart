import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mealorium/Constants/custom_textstyles.dart';
import 'package:mealorium/Constants/cutsom_colors.dart';
import 'package:mealorium/Widgets/favourite_dish.dart';
import 'package:mealorium/Widgets/search_address.dart';
import 'package:mealorium/Widgets/shop_tile.dart';
import 'package:mealorium/Widgets/vendor_outlet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          title: SearchAddressWidget(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  LineIcons.alternateSignOut,
                  color: CustomColors.emphasisBlue,
                  size: 27,
                ))
          ],
          elevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, bottom: 12.h),
                child: Text(
                  "Popular Near You",
                  style: MyTextStyles.heading,
                ),
              ),
              SizedBox(
                height: 150.h,
                child: ListView.separated(
                    itemCount: 15,
                    separatorBuilder: ((context, index) => SizedBox(
                          width: 13.w,
                        )),
                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) => ShopTileWidget()),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 15.h, bottom: 12.h),
                  child: Text("Your Favorites", style: MyTextStyles.heading)),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 13.w,
                  ),
                  itemBuilder: ((context, index) => FavouriteDishTile()),
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13.w, bottom: 13.h),
                child: Text(
                  "All Outlets",
                  style: MyTextStyles.heading,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.separated(
                    separatorBuilder: ((context, index) =>
                        Padding(padding: EdgeInsets.only(bottom: 8.h))),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => VendorOutletWidget()),
              )
            ]),
      ),
    );
  }
}
