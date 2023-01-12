import 'package:flutter/material.dart';
import 'package:tourism/misc/colors.dart';
import 'package:tourism/widgets/app_buttons.dart';
import 'package:tourism/widgets/app_text.dart';
import 'package:tourism/widgets/large_text.dart';
import 'package:tourism/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            // BG IMAGE
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/img/mountain.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // ICONS
            Positioned(
              left: 20,
              right: 20,
              top: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.sell_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            // DETAILS
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                ),
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      30,
                    ),
                    topRight: Radius.circular(
                      30,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Yosmite ',
                          // size: 25,
                        ),
                        AppLargeText(
                          text: '\$150',
                          size: 25,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 12,
                        ),
                        AppText(
                          text: 'Abuja, Nigeria',
                          size: 12,
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              size: 16,
                              color: gottenStars < index
                                  ? Colors.black
                                  : AppColors.starColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText(
                          text: '4.0',
                          size: 14,
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: 'People',
                      size: 18,
                    ),
                    AppText(
                      text: 'people are talking about this like seriously.',
                      size: 14,
                      color: AppColors.textColor2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: AppButtons(
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              borderColor: AppColors.buttonBackground,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black12,
                              size: 50,
                              text: (index + 1).toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppLargeText(
                      text: 'Description',
                      size: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text:
                          'type=1400 audit(0.0:150021): avc: denied { search } for name="battery" dev="sysfs" ino=6688 scontext=u:r:untrusted_app:s0:c204,c257,c512,c768 tcontext=u:object_r:sysfs_batteryinfo:s0 tclass=dir permissive=',
                      size: 14,
                      color: AppColors.textColor2,
                    ),
                  ],
                ),
              ),
            ),

            // DOWN BUTTON
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    icon: Icons.favorite,
                    isIcon: true,
                    size: 60,
                    color: AppColors.textColor2,
                    backgroundColor: AppColors.buttonBackground,
                    borderColor: AppColors.buttonBackground,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ResponsiveButton(
                    isResponsive: true,
                    text: 'Book trip now',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
