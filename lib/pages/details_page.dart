import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/cubit_cubit.dart';
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
    return BlocBuilder<CubitCubit, CubitState>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://mark.bslmeiyu.com/uploads/${detail.place.img}',
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
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          BlocProvider.of<CubitCubit>(context).goHome();
                        },
                      ),
                      const Icon(
                        Icons.menu,
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
                              text: detail.place.name,
                              // size: 25,
                            ),
                            AppLargeText(
                              text: '\$ ${detail.place.price}',
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
                              text: detail.place.location,
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
                                  color: index < detail.place.stars
                                      ? AppColors.starColor
                                      : Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: detail.place.stars.toString(),
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
                          text: detail.place.description,
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
      },
    );
  }
}
